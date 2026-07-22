param(
    $Message,
    $TriggerMetadata
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# ============================================================================
# Function: avd-tag-assignment
# Runtime : Azure Functions PowerShell
# Purpose : Process admin requests in avd-vm-master.csv.
# Cloud   : Azure Government / GCC High ready
#
# This script uses the exact CSV schema provided by the user.
# User/admin columns:
# - NewAssignedUser: user UPN to assign, or REMOVE/UNASSIGN/CLEAR/DELETE to unassign.
# - az_res_costcenter: tag value to assign, or REMOVE/UNASSIGN/CLEAR/DELETE to remove the CostCenter tag.
# - RequestStatus  : Submit or Submitted to ask the function to process the row.
#
# Function-managed result columns:
# - AssignedUser, CostCenter, RequestStatus, RequestMessage.
#
# Change-aware behavior:
# - If there are no submitted request rows, the CSV is not written.
# - If submitted values already match current values, Azure updates are skipped.
# - The CSV is updated once to mark the request as Skipped, Succeeded, or Failed.
# - Normal Azure VMs are not processed because every row is validated against
#   the live AVD host pool/session host before any tag or assignment update.
# ============================================================================

$CsvColumns = @(
    "VmName",
    "VmResourceId",
    "ResourceGroup",
    "HostPoolName",
    "HostPoolResourceGroup",
    "SessionHostName",
    "PrivateIpAddress",
    "AssignedUser",
    "CostCenter",
    "VmSize",
    "NicName",
    "OsDiskName",
    "DataDiskNames",
    "Status",
    "LastSeenUtc",
    "NewAssignedUser",
    "az_res_costcenter",
    "RequestStatus",
    "RequestMessage"
)

$AuditColumns = @(
    "AuditTimeUtc",
    "FunctionName",
    "Action",
    "VmName",
    "VmResourceId",
    "HostPoolName",
    "Result",
    "Message"
)

function Write-Stage {
    param(
        [Parameter(Mandatory)][string]$Stage,
        [Parameter(Mandatory)][string]$Message
    )
    Write-Host "[$Stage] $Message"
}

function Get-StringValue {
    param([AllowNull()][object]$Value)
    if ($null -eq $Value) { return "" }
    return ([string]$Value).Trim()
}

function Get-RequiredSetting {
    param([Parameter(Mandatory)][string]$Name)
    $value = [Environment]::GetEnvironmentVariable($Name)
    if ([string]::IsNullOrWhiteSpace($value)) { throw "Required Function App setting '$Name' is missing or empty." }
    return $value.Trim()
}

function Get-OptionalSetting {
    param(
        [Parameter(Mandatory)][string]$Name,
        [string]$DefaultValue = ""
    )
    $value = [Environment]::GetEnvironmentVariable($Name)
    if ([string]::IsNullOrWhiteSpace($value)) { return $DefaultValue }
    return $value.Trim()
}

function Get-SettingList {
    param(
        [Parameter(Mandatory)][string]$Name,
        [string]$DefaultValue = ""
    )
    $raw = Get-OptionalSetting -Name $Name -DefaultValue $DefaultValue
    if ([string]::IsNullOrWhiteSpace($raw)) { return @() }
    return @($raw -split "," | ForEach-Object { $_.Trim() } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
}

function ConvertFrom-SecureToken {
    param([AllowNull()][object]$Token)
    if ($null -eq $Token) { return "" }
    if ($Token -is [securestring]) {
        $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($Token)
        try { return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr) }
        finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }
    }
    return [string]$Token
}

function Get-BlobEndpointSuffix {
    $azureEnvironment = Get-OptionalSetting -Name "AZURE_ENVIRONMENT" -DefaultValue "AzureUSGovernment"
    if ($azureEnvironment -ne "AzureUSGovernment") {
        throw "Unsupported AZURE_ENVIRONMENT '$azureEnvironment'. This function package is configured for GCC High / AzureUSGovernment only."
    }

    return "blob.core.usgovcloudapi.net"
}

function Get-StorageBearerToken {
    # GCC High / Azure Government: do not hard-code the commercial storage audience.
    # Get-AzAccessToken -ResourceTypeName Storage resolves the Storage token resource from the current Az environment.
    # The current Az environment is set during Connect-AzAccount using AZURE_ENVIRONMENT = AzureUSGovernment.
    $resourceTypeName = Get-OptionalSetting -Name "STORAGE_TOKEN_RESOURCE_TYPE_NAME" -DefaultValue "Storage"

    try {
        $context = Get-AzContext -ErrorAction SilentlyContinue
        $environmentName = if ($context -and $context.Environment -and $context.Environment.Name) { $context.Environment.Name } else { "unknown" }
        Write-Host "Requesting Azure Storage bearer token using ResourceTypeName='$resourceTypeName' for Az environment='$environmentName'."

        $tokenResult = Get-AzAccessToken -ResourceTypeName $resourceTypeName -ErrorAction Stop
        $token = ConvertFrom-SecureToken -Token $tokenResult.Token
        if ([string]::IsNullOrWhiteSpace($token)) { throw "Unable to acquire Azure Storage bearer token." }
        return $token
    }
    catch {
        $resourceUrl = Get-OptionalSetting -Name "STORAGE_TOKEN_RESOURCE_URL" -DefaultValue ""
        if ([string]::IsNullOrWhiteSpace($resourceUrl)) {
            throw "Unable to acquire Azure Storage bearer token with -ResourceTypeName '$resourceTypeName'. Check that Az.Accounts supports ResourceTypeName Storage and that AZURE_ENVIRONMENT is AzureUSGovernment. Original error: $($_.Exception.Message)"
        }

        Write-Host "Storage token ResourceTypeName failed. Retrying with explicit STORAGE_TOKEN_RESOURCE_URL='$resourceUrl'."
        $tokenResult = Get-AzAccessToken -ResourceUrl $resourceUrl -ErrorAction Stop
        $token = ConvertFrom-SecureToken -Token $tokenResult.Token
        if ([string]::IsNullOrWhiteSpace($token)) { throw "Unable to acquire Azure Storage bearer token." }
        return $token
    }
}

function Get-BlobBaseUri {
    $storageAccount = Get-RequiredSetting -Name "STORAGE_ACCOUNT_NAME"
    $containerName  = Get-RequiredSetting -Name "STORAGE_CONTAINER_NAME"
    $suffix         = Get-BlobEndpointSuffix
    return "https://$storageAccount.$suffix/$containerName"
}

function Get-EncodedBlobUri {
    param([Parameter(Mandatory)][string]$BlobName)
    $encodedName = ($BlobName -split "/" | ForEach-Object { [System.Uri]::EscapeDataString($_) }) -join "/"
    return "$(Get-BlobBaseUri)/$encodedName"
}

function Get-HttpStatusCode {
    param([Parameter(Mandatory)]$ErrorRecord)
    try {
        if ($ErrorRecord.Exception.Response -and $ErrorRecord.Exception.Response.StatusCode) { return [int]$ErrorRecord.Exception.Response.StatusCode }
    }
    catch { return $null }
    return $null
}

function Invoke-BlobRest {
    param(
        [Parameter(Mandatory)][string]$Method,
        [Parameter(Mandatory)][string]$Uri,
        [hashtable]$ExtraHeaders,
        [byte[]]$BodyBytes,
        [string]$ContentType = "text/plain; charset=utf-8"
    )

    $headers = @{
        Authorization  = "Bearer $(Get-StorageBearerToken)"
        "x-ms-date"   = (Get-Date).ToUniversalTime().ToString("R")
        "x-ms-version" = "2021-12-02"
    }
    if ($ExtraHeaders) { foreach ($key in $ExtraHeaders.Keys) { $headers[$key] = $ExtraHeaders[$key] } }

    if ($null -ne $BodyBytes) {
        return Invoke-WebRequest -Method $Method -Uri $Uri -Headers $headers -Body $BodyBytes -ContentType $ContentType -UseBasicParsing -ErrorAction Stop
    }
    return Invoke-WebRequest -Method $Method -Uri $Uri -Headers $headers -UseBasicParsing -ErrorAction Stop
}

function Get-BlobText {
    param([Parameter(Mandatory)][string]$BlobName)
    try { return [string](Invoke-BlobRest -Method "GET" -Uri (Get-EncodedBlobUri -BlobName $BlobName)).Content }
    catch {
        $statusCode = Get-HttpStatusCode -ErrorRecord $_
        if ($statusCode -eq 404) { return "" }
        throw
    }
}

function Set-BlobText {
    param(
        [Parameter(Mandatory)][string]$BlobName,
        [Parameter(Mandatory)][string]$Text,
        [string]$LeaseId
    )
    $headers = @{ "x-ms-blob-type" = "BlockBlob" }
    if (-not [string]::IsNullOrWhiteSpace($LeaseId)) { $headers["x-ms-lease-id"] = $LeaseId }
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($Text)
    Invoke-BlobRest -Method "PUT" -Uri (Get-EncodedBlobUri -BlobName $BlobName) -ExtraHeaders $headers -BodyBytes $bytes -ContentType "text/csv; charset=utf-8" | Out-Null
}

function Ensure-CsvBlobExists {
    param(
        [Parameter(Mandatory)][string]$BlobName,
        [Parameter(Mandatory)][string[]]$Columns
    )
    $existing = Get-BlobText -BlobName $BlobName
    if ([string]::IsNullOrWhiteSpace($existing)) {
        Set-BlobText -BlobName $BlobName -Text (($Columns -join ",") + "`r`n")
        Write-Stage -Stage "BLOB" -Message "Created missing CSV blob '$BlobName'."
    }
}

function Acquire-BlobLease {
    param([Parameter(Mandatory)][string]$BlobName)
    $uri = "$(Get-EncodedBlobUri -BlobName $BlobName)`?comp=lease"
    $headers = @{
        "x-ms-lease-action"   = "acquire"
        "x-ms-lease-duration" = "-1"
    }
    for ($attempt = 1; $attempt -le 6; $attempt++) {
        try {
            $response = Invoke-BlobRest -Method "PUT" -Uri $uri -ExtraHeaders $headers
            return [string]$response.Headers["x-ms-lease-id"]
        }
        catch {
            if ($attempt -eq 6) { throw }
            Write-Warning "Could not acquire blob lease for '$BlobName'. Retry $attempt of 6."
            Start-Sleep -Seconds 10
        }
    }
}

function Release-BlobLease {
    param(
        [Parameter(Mandatory)][string]$BlobName,
        [Parameter(Mandatory)][string]$LeaseId
    )

    if ([string]::IsNullOrWhiteSpace($LeaseId)) {
        Write-Warning "[LEASE] No lease ID was supplied for '$BlobName'. Release skipped."
        return
    }

    $uri = "$(Get-EncodedBlobUri -BlobName $BlobName)`?comp=lease"
    $headers = @{
        "x-ms-lease-action" = "release"
        "x-ms-lease-id"     = $LeaseId
    }

    try {
        Invoke-BlobRest -Method "PUT" -Uri $uri -ExtraHeaders $headers | Out-Null
        Write-Host "[LEASE] Released CSV lease for '$BlobName'."
    }
    catch {
        # Lease cleanup must not hide the real request result.
        Write-Warning "[LEASE] Unable to release lease for '$BlobName'. $($_.Exception.Message)"
    }
}

function Assert-CsvHeader {
    param(
        [Parameter(Mandatory)][string]$CsvText,
        [Parameter(Mandatory)][string[]]$Columns,
        [Parameter(Mandatory)][string]$BlobName
    )
    if ([string]::IsNullOrWhiteSpace($CsvText)) { return }
    $firstLine = ([regex]::Split($CsvText, "`r`n|`n|`r") | Select-Object -First 1)
    $actualColumns = @($firstLine.Split(",") | ForEach-Object { $_.Trim().Trim('"') })
    $missing = @($Columns | Where-Object { $actualColumns -notcontains $_ })
    $extra = @($actualColumns | Where-Object { $Columns -notcontains $_ })
    if ($missing.Count -gt 0 -or $extra.Count -gt 0) {
        throw "CSV schema mismatch in '$BlobName'. Missing columns: $($missing -join ', '). Extra columns: $($extra -join ', '). Use the exact provided CSV header."
    }
}

function New-EmptyCsvRow {
    $ordered = [ordered]@{}
    foreach ($column in $CsvColumns) { $ordered[$column] = "" }
    return [pscustomobject]$ordered
}

function Get-RowValue {
    param([Parameter(Mandatory)]$Row, [Parameter(Mandatory)][string]$Column)
    if ($Row.PSObject.Properties[$Column]) { return Get-StringValue -Value $Row.PSObject.Properties[$Column].Value }
    return ""
}

function Set-RowValue {
    param([Parameter(Mandatory)]$Row, [Parameter(Mandatory)][string]$Column, [AllowNull()][string]$Value)
    $Row.PSObject.Properties[$Column].Value = (Get-StringValue -Value $Value)
}

function Normalize-CsvRow {
    param([Parameter(Mandatory)]$Row)
    $normalized = New-EmptyCsvRow
    foreach ($column in $CsvColumns) {
        if ($Row.PSObject.Properties[$column]) { Set-RowValue -Row $normalized -Column $column -Value $Row.PSObject.Properties[$column].Value }
    }
    return $normalized
}

function Test-EmptyCsvRow {
    param([Parameter(Mandatory)]$Row)
    foreach ($column in $CsvColumns) { if (-not [string]::IsNullOrWhiteSpace((Get-RowValue -Row $Row -Column $column))) { return $false } }
    return $true
}

function Convert-CsvTextToRows {
    param([string]$CsvText)
    if ([string]::IsNullOrWhiteSpace($CsvText)) { return @() }
    return @($CsvText | ConvertFrom-Csv | ForEach-Object { Normalize-CsvRow -Row $_ } | Where-Object { -not (Test-EmptyCsvRow -Row $_) })
}

function Convert-RowsToCsvText {
    param([object[]]$Rows)
    $normalizedRows = @($Rows | ForEach-Object { Normalize-CsvRow -Row $_ })
    if ($normalizedRows.Count -eq 0) { return ($CsvColumns -join ",") + "`r`n" }
    $csvLines = @($normalizedRows | Select-Object $CsvColumns | ConvertTo-Csv -NoTypeInformation)
    return ($csvLines -join "`r`n") + "`r`n"
}

function New-AuditRow {
    param(
        [Parameter(Mandatory)][string]$Action,
        [string]$VmName = "",
        [string]$VmResourceId = "",
        [string]$HostPoolName = "",
        [string]$Result = "Information",
        [string]$Message = ""
    )
    return [pscustomobject][ordered]@{
        AuditTimeUtc = (Get-Date).ToUniversalTime().ToString("o")
        FunctionName = "avd-tag-assignment"
        Action = $Action
        VmName = $VmName
        VmResourceId = $VmResourceId
        HostPoolName = $HostPoolName
        Result = $Result
        Message = $Message
    }
}

function Convert-AuditRowsToCsvText {
    param([object[]]$Rows)
    if ($Rows.Count -eq 0) { return ($AuditColumns -join ",") + "`r`n" }
    $csvLines = @($Rows | Select-Object $AuditColumns | ConvertTo-Csv -NoTypeInformation)
    return ($csvLines -join "`r`n") + "`r`n"
}

function Append-AuditRows {
    param([object[]]$AuditRows)
    if ($AuditRows.Count -eq 0) { return }
    $auditBlob = Get-OptionalSetting -Name "STATUS_CSV_BLOB" -DefaultValue "state/avd-vm-processing-status.csv"
    Ensure-CsvBlobExists -BlobName $auditBlob -Columns $AuditColumns
    $leaseId = $null
    try {
        $leaseId = Acquire-BlobLease -BlobName $auditBlob
        $existingText = Get-BlobText -BlobName $auditBlob
        $existingRows = @()
        if (-not [string]::IsNullOrWhiteSpace($existingText)) { $existingRows = @($existingText | ConvertFrom-Csv) }
        $allRows = @($existingRows + $AuditRows)
        Set-BlobText -BlobName $auditBlob -Text (Convert-AuditRowsToCsvText -Rows $allRows) -LeaseId $leaseId
    }
    finally {
        if (-not [string]::IsNullOrWhiteSpace($leaseId)) { Release-BlobLease -BlobName $auditBlob -LeaseId $leaseId }
    }
}

function Get-ResourceNameFromResourceId {
    param([string]$ResourceId)
    if ([string]::IsNullOrWhiteSpace($ResourceId)) { return "" }
    return ($ResourceId -split "/")[-1]
}

function Get-SessionHostResourceName {
    param([Parameter(Mandatory)]$SessionHost)
    return (($SessionHost.Name -split "/")[-1])
}

function Get-SessionHostVmName {
    param([Parameter(Mandatory)]$SessionHost)
    return (((Get-SessionHostResourceName -SessionHost $SessionHost) -split "\.")[0])
}

function Get-SessionHostAssignedUser {
    param([Parameter(Mandatory)]$SessionHost)
    if ($SessionHost.PSObject.Properties["AssignedUser"]) { return Get-StringValue -Value $SessionHost.AssignedUser }
    if ($SessionHost.PSObject.Properties["Properties"] -and $SessionHost.Properties.PSObject.Properties["AssignedUser"]) { return Get-StringValue -Value $SessionHost.Properties.AssignedUser }
    return ""
}

function Get-SessionHostVmResourceId {
    param([Parameter(Mandatory)]$SessionHost)
    foreach ($propertyName in @("ResourceId", "VirtualMachineId")) {
        if ($SessionHost.PSObject.Properties[$propertyName]) {
            $candidate = Get-StringValue -Value $SessionHost.$propertyName
            if ($candidate -match "/providers/Microsoft.Compute/virtualMachines/") { return $candidate }
        }
    }
    if ($SessionHost.PSObject.Properties["Properties"]) {
        foreach ($propertyName in @("ResourceId", "VirtualMachineId")) {
            if ($SessionHost.Properties.PSObject.Properties[$propertyName]) {
                $candidate = Get-StringValue -Value $SessionHost.Properties.$propertyName
                if ($candidate -match "/providers/Microsoft.Compute/virtualMachines/") { return $candidate }
            }
        }
    }
    return ""
}

function Find-LiveSessionHostForRow {
    param([Parameter(Mandatory)]$Row)
    $hostPoolRg = Get-RowValue -Row $Row -Column "HostPoolResourceGroup"
    $hostPoolName = Get-RowValue -Row $Row -Column "HostPoolName"
    $vmName = Get-RowValue -Row $Row -Column "VmName"
    $rowSessionHostName = Get-RowValue -Row $Row -Column "SessionHostName"
    $rowVmId = Get-RowValue -Row $Row -Column "VmResourceId"
    $subscriptionId = Get-RequiredSetting -Name "AZURE_SUBSCRIPTION_ID"

    if ([string]::IsNullOrWhiteSpace($hostPoolRg) -or [string]::IsNullOrWhiteSpace($hostPoolName) -or [string]::IsNullOrWhiteSpace($vmName)) {
        throw "CSV row is missing HostPoolResourceGroup, HostPoolName, or VmName."
    }

    $sessionHosts = @(Get-AzWvdSessionHost -ResourceGroupName $hostPoolRg -HostPoolName $hostPoolName -SubscriptionId $subscriptionId -ErrorAction Stop)
    $matches = @()
    foreach ($sessionHost in $sessionHosts) {
        $sessionVmName = Get-SessionHostVmName -SessionHost $sessionHost
        $sessionVmId = Get-SessionHostVmResourceId -SessionHost $sessionHost
        if ($sessionHost.Name -ieq $rowSessionHostName -or $sessionVmName -ieq $vmName -or ((-not [string]::IsNullOrWhiteSpace($rowVmId)) -and $sessionVmId -ieq $rowVmId)) {
            $matches += $sessionHost
        }
    }

    if ($matches.Count -eq 0) { throw "No live AVD session host matched CSV row '$vmName'. The row will not be processed as a normal VM." }
    if ($matches.Count -gt 1) { throw "More than one live AVD session host matched CSV row '$vmName'. The row is ambiguous and was not processed." }
    return $matches[0]
}

function Get-TagTargetResourceIds {
    param([Parameter(Mandatory)]$Vm)
    $targetSetting = Get-SettingList -Name "TAG_TARGETS" -DefaultValue "VM,NIC,OSDisk,DataDisks"
    if ($targetSetting.Count -eq 0) { $targetSetting = @("VM", "NIC", "OSDisk", "DataDisks") }

    $targetIds = New-Object System.Collections.Generic.List[string]
    foreach ($target in $targetSetting) {
        switch ($target.ToLowerInvariant()) {
            "vm" { if (-not [string]::IsNullOrWhiteSpace($Vm.Id)) { $targetIds.Add($Vm.Id) } }
            "nic" {
                foreach ($nicRef in @($Vm.NetworkProfile.NetworkInterfaces)) {
                    if (-not [string]::IsNullOrWhiteSpace($nicRef.Id)) { $targetIds.Add($nicRef.Id) }
                }
            }
            "osdisk" {
                $diskId = Get-StringValue -Value $Vm.StorageProfile.OsDisk.ManagedDisk.Id
                if (-not [string]::IsNullOrWhiteSpace($diskId)) { $targetIds.Add($diskId) }
            }
            "datadisks" {
                foreach ($disk in @($Vm.StorageProfile.DataDisks)) {
                    $diskId = Get-StringValue -Value $disk.ManagedDisk.Id
                    if (-not [string]::IsNullOrWhiteSpace($diskId)) { $targetIds.Add($diskId) }
                }
            }
            default { Write-Warning "Unsupported TAG_TARGETS value '$target'. Supported values: VM,NIC,OSDisk,DataDisks." }
        }
    }

    return @($targetIds.ToArray() | Select-Object -Unique)
}

function Test-RemoveToken {
    param([AllowNull()][AllowEmptyString()][string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return $false
    }

    return @("REMOVE", "UNASSIGN", "CLEAR", "DELETE") -contains $Value.Trim().ToUpperInvariant()
}

function Update-CostCenterTagTargets {
    param(
        [Parameter(Mandatory)]$Vm,
        [Parameter(Mandatory)][string]$RequestedCostCenter
    )
    $targetIds = @(Get-TagTargetResourceIds -Vm $Vm)
    if ($targetIds.Count -eq 0) { throw "No target resources were found for tag update." }

    if (Test-RemoveToken -Value $RequestedCostCenter) {
        Write-Host "[TAG] Remove token '$RequestedCostCenter' detected. Removing CostCenter tag from $($targetIds.Count) resource(s)."

        foreach ($resourceId in $targetIds) {
            $resource = Get-AzResource -ResourceId $resourceId -ErrorAction Stop
            $remainingTags = @{}
            $costCenterFound = $false

            if ($null -ne $resource.Tags) {
                foreach ($tagKey in $resource.Tags.Keys) {
                    if ($tagKey -ieq "CostCenter") {
                        $costCenterFound = $true
                        Write-Host "[TAG] Removing tag '$tagKey' from '$resourceId'."
                        continue
                    }

                    $remainingTags[[string]$tagKey] = [string]$resource.Tags[$tagKey]
                }
            }

            if (-not $costCenterFound) {
                Write-Host "[TAG] CostCenter tag is already absent on '$resourceId'."
                continue
            }

            # Replace with the remaining tag set. This preserves every other tag
            # and reliably removes CostCenter even when its current value is unknown.
            Update-AzTag `
                -ResourceId $resourceId `
                -Tag $remainingTags `
                -Operation Replace `
                -ErrorAction Stop | Out-Null

            $actualAfterRemoval = Get-ResourceCostCenterTag -ResourceId $resourceId
            if (-not [string]::IsNullOrWhiteSpace($actualAfterRemoval)) {
                throw "CostCenter tag removal verification failed for '$resourceId'. Azure returned '$actualAfterRemoval'."
            }

            Write-Host "[TAG] CostCenter tag removal verified for '$resourceId'."
        }

        return "CostCenter tag removed from $($targetIds.Count) resource(s)."
    }

    $normalizedCostCenter = $RequestedCostCenter.Trim()
    Write-Host "[TAG] Applying CostCenter='$normalizedCostCenter' to $($targetIds.Count) resource(s)."
    foreach ($resourceId in $targetIds) {
        Update-AzTag -ResourceId $resourceId -Tag @{ "CostCenter" = $normalizedCostCenter } -Operation Merge -ErrorAction Stop | Out-Null
    }
    return "CostCenter tag '$normalizedCostCenter' applied to $($targetIds.Count) resource(s)."
}


function Get-ResourceCostCenterTag {
    param([Parameter(Mandatory)][string]$ResourceId)
    $resource = Get-AzResource -ResourceId $ResourceId -ErrorAction Stop
    if ($null -eq $resource.Tags) { return "" }
    foreach ($key in $resource.Tags.Keys) {
        if ($key -ieq "CostCenter") { return Get-StringValue -Value $resource.Tags[$key] }
    }
    return ""
}

function Test-CostCenterTagTargetsMatch {
    param(
        [Parameter(Mandatory)]$Vm,
        [Parameter(Mandatory)][AllowEmptyString()][string]$ExpectedCostCenter
    )
    $targetIds = @(Get-TagTargetResourceIds -Vm $Vm)
    if ($targetIds.Count -eq 0) { return $false }
    foreach ($resourceId in $targetIds) {
        $actual = Get-ResourceCostCenterTag -ResourceId $resourceId
        if ($actual -ne $ExpectedCostCenter) { return $false }
    }
    return $true
}

function Set-AvdSessionHostAssignedUser {
    param(
        [Parameter(Mandatory)]$Row,
        [Parameter(Mandatory)]$LiveSessionHost,
        [AllowNull()][object]$TargetAssignedUser
    )

    $subscriptionId = Get-RequiredSetting -Name "AZURE_SUBSCRIPTION_ID"
    $hostPoolRg = Get-RowValue -Row $Row -Column "HostPoolResourceGroup"
    $hostPoolName = Get-RowValue -Row $Row -Column "HostPoolName"
    $sessionHostResourceName = Get-SessionHostResourceName -SessionHost $LiveSessionHost
    $apiVersion = Get-OptionalSetting -Name "AVD_SESSION_HOST_API_VERSION" -DefaultValue "2023-09-05"

    if ([string]::IsNullOrWhiteSpace($hostPoolRg)) {
        throw "HostPoolResourceGroup is empty in the CSV row."
    }
    if ([string]::IsNullOrWhiteSpace($hostPoolName)) {
        throw "HostPoolName is empty in the CSV row."
    }
    if ([string]::IsNullOrWhiteSpace($sessionHostResourceName)) {
        throw "Unable to determine the AVD session host resource name."
    }

    $resourceId = "/subscriptions/${subscriptionId}/resourceGroups/${hostPoolRg}/providers/Microsoft.DesktopVirtualization/hostPools/${hostPoolName}/sessionHosts/${sessionHostResourceName}"
    $requestPath = "${resourceId}?api-version=${apiVersion}&force=true"
    $targetDisplay = if ($null -eq $TargetAssignedUser) { "<empty>" } else { [string]$TargetAssignedUser }

    Write-Host "[ASSIGNMENT] Starting AVD session-host assignment operation."
    Write-Host "[ASSIGNMENT] SubscriptionId='$subscriptionId'"
    Write-Host "[ASSIGNMENT] HostPoolResourceGroup='$hostPoolRg'"
    Write-Host "[ASSIGNMENT] HostPoolName='$hostPoolName'"
    Write-Host "[ASSIGNMENT] SessionHostResourceName='$sessionHostResourceName'"
    Write-Host "[ASSIGNMENT] TargetAssignedUser='$targetDisplay'"
    Write-Host "[ASSIGNMENT] ApiVersion='$apiVersion'"

    Write-Host "[ASSIGNMENT] Validating host-pool configuration."
    $hostPool = Get-AzWvdHostPool `
        -ResourceGroupName $hostPoolRg `
        -Name $hostPoolName `
        -SubscriptionId $subscriptionId `
        -ErrorAction Stop

    Write-Host "[ASSIGNMENT] HostPoolType='$($hostPool.HostPoolType)'"
    Write-Host "[ASSIGNMENT] PersonalDesktopAssignmentType='$($hostPool.PersonalDesktopAssignmentType)'"

    if ($hostPool.HostPoolType -ine "Personal") {
        throw "User assignment is supported only for a Personal host pool. Host pool '$hostPoolName' has type '$($hostPool.HostPoolType)'."
    }

    if ($hostPool.PersonalDesktopAssignmentType -ine "Direct") {
        Write-Warning "[ASSIGNMENT] Host pool '$hostPoolName' uses assignment type '$($hostPool.PersonalDesktopAssignmentType)', not 'Direct'. Explicit user assignment may not behave as expected."
    }

    $assignedUserPayload = if ([string]::IsNullOrWhiteSpace([string]$TargetAssignedUser)) {
        # Azure Virtual Desktop requires an empty string plus force=true to unassign.
        ""
    }
    else {
        ([string]$TargetAssignedUser).Trim()
    }

    $bodyObject = @{
        properties = @{
            assignedUser = $assignedUserPayload
        }
    }
    $body = $bodyObject | ConvertTo-Json -Depth 10 -Compress

    Write-Host "[ASSIGNMENT] Sending PATCH request."
    Write-Host "[ASSIGNMENT] ResourceId='$resourceId'"
    Write-Host "[ASSIGNMENT] ApiVersion='$apiVersion'"
    Write-Host "[ASSIGNMENT] RequestPath='$requestPath'"
    Write-Host "[ASSIGNMENT] RequestPayload=$body"

    $patchParameters = @{
        Path        = $requestPath
        Method      = "PATCH"
        Payload     = $body
        ErrorAction = "Stop"
    }

    $patchResponse = Invoke-AzRestMethod @patchParameters

    Write-Host "[ASSIGNMENT] PATCH completed. StatusCode='$($patchResponse.StatusCode)'"
    if (-not [string]::IsNullOrWhiteSpace([string]$patchResponse.Content)) {
        Write-Host "[ASSIGNMENT] PATCH response content: $($patchResponse.Content)"
    }

    if ($patchResponse.StatusCode -notin @(200, 201, 202)) {
        throw "Assignment PATCH returned unexpected status code '$($patchResponse.StatusCode)'. Response: $($patchResponse.Content)"
    }

    $maximumAttempts = 10
    $delaySeconds = 5
    $verifiedAssignedUser = ""

    for ($attempt = 1; $attempt -le $maximumAttempts; $attempt++) {
        Write-Host "[ASSIGNMENT] Verification attempt $attempt of $maximumAttempts. Waiting $delaySeconds second(s)."
        Start-Sleep -Seconds $delaySeconds

        try {
            $getParameters = @{
                Path        = $requestPath
                Method      = "GET"
                ErrorAction = "Stop"
            }

            $getResponse = Invoke-AzRestMethod @getParameters

            Write-Host "[ASSIGNMENT] Verification GET status code='$($getResponse.StatusCode)'"

            if ($getResponse.StatusCode -ne 200) {
                Write-Warning "[ASSIGNMENT] Verification GET returned status code '$($getResponse.StatusCode)'."
                continue
            }

            if ([string]::IsNullOrWhiteSpace([string]$getResponse.Content)) {
                Write-Warning "[ASSIGNMENT] Verification GET returned empty content."
                continue
            }

            $responseObject = $getResponse.Content | ConvertFrom-Json
            if ($null -ne $responseObject.properties -and $responseObject.properties.PSObject.Properties["assignedUser"]) {
                $verifiedAssignedUser = Get-StringValue -Value $responseObject.properties.assignedUser
            }
            else {
                $verifiedAssignedUser = ""
            }

            Write-Host "[ASSIGNMENT] Azure currently returns assignedUser='$verifiedAssignedUser'."

            if ([string]::IsNullOrWhiteSpace([string]$TargetAssignedUser)) {
                if ([string]::IsNullOrWhiteSpace($verifiedAssignedUser)) {
                    Write-Host "[ASSIGNMENT] User unassignment verified successfully."
                    return ""
                }
            }
            elseif ($verifiedAssignedUser -ieq ([string]$TargetAssignedUser).Trim()) {
                Write-Host "[ASSIGNMENT] User assignment verified successfully."
                return $verifiedAssignedUser
            }

            Write-Warning "[ASSIGNMENT] Assignment has not propagated yet. Expected='$targetDisplay', Actual='$verifiedAssignedUser'."
        }
        catch {
            Write-Warning "[ASSIGNMENT] Verification attempt $attempt failed. $($_.Exception.Message)"
        }
    }

    if ([string]::IsNullOrWhiteSpace([string]$TargetAssignedUser)) {
        throw "Assignment verification failed after $maximumAttempts attempts. Expected no assigned user, but Azure returned '$verifiedAssignedUser'."
    }

    throw "Assignment verification failed after $maximumAttempts attempts. Expected '$TargetAssignedUser', but Azure returned '$verifiedAssignedUser'."
}

function Set-RequestResult {
    param(
        [Parameter(Mandatory)]$Row,
        [Parameter(Mandatory)][string]$Status,
        [Parameter(Mandatory)][string]$Message
    )
    Set-RowValue -Row $Row -Column "RequestStatus" -Value $Status
    Set-RowValue -Row $Row -Column "RequestMessage" -Value $Message
}


function ConvertTo-ServiceBusMessageText {
    param([AllowNull()][object]$InputObject)

    if ($null -eq $InputObject) { return "" }
    if ($InputObject -is [byte[]]) { return [System.Text.Encoding]::UTF8.GetString($InputObject) }
    if ($InputObject -is [string]) { return $InputObject }

    return ($InputObject | ConvertTo-Json -Depth 100 -Compress)
}

function Get-ObjectPropertyValue {
    param(
        [AllowNull()][object]$Object,
        [Parameter(Mandatory)][string[]]$Names
    )

    if ($null -eq $Object) { return $null }

    foreach ($name in $Names) {
        $property = $Object.PSObject.Properties[$name]
        if ($null -ne $property) { return $property.Value }
    }

    foreach ($name in $Names) {
        foreach ($property in $Object.PSObject.Properties) {
            if ($property.Name.Equals($name, [System.StringComparison]::OrdinalIgnoreCase)) {
                return $property.Value
            }
        }
    }

    return $null
}

function Test-TargetCsvBlobCreatedMessage {
    param(
        [AllowNull()][object]$InputObject,
        [Parameter(Mandatory)][string]$ContainerName,
        [Parameter(Mandatory)][string]$BlobName
    )

    $messageText = ConvertTo-ServiceBusMessageText -InputObject $InputObject
    Write-Host "[TRIGGER] Service Bus message payload length: $($messageText.Length)"

    if ([string]::IsNullOrWhiteSpace($messageText)) {
        Write-Warning "[TRIGGER] Service Bus message body is empty. Tag assignment will not process."
        return $false
    }

    try {
        $parsed = $messageText | ConvertFrom-Json -Depth 100
    }
    catch {
        Write-Warning "[TRIGGER] Service Bus message is not valid JSON. Error='$($_.Exception.Message)'. Tag assignment will not process."
        return $false
    }

    $events = @($parsed)
    Write-Host "[TRIGGER] Event Grid event count in Service Bus message: $($events.Count)"

    $targetSuffix = "/blobServices/default/containers/$ContainerName/blobs/$BlobName"

    foreach ($event in $events) {
        $eventType = [string](Get-ObjectPropertyValue -Object $event -Names @('eventType','type'))
        $subject = [string](Get-ObjectPropertyValue -Object $event -Names @('subject'))
        $decodedSubject = if ([string]::IsNullOrWhiteSpace($subject)) { "" } else { [Uri]::UnescapeDataString($subject) }

        Write-Host "[TRIGGER] EventType='$eventType'"
        Write-Host "[TRIGGER] Subject='$subject'"

        $isBlobCreated = $eventType.Equals('Microsoft.Storage.BlobCreated', [System.StringComparison]::OrdinalIgnoreCase)
        $isTargetBlob = $decodedSubject.EndsWith($targetSuffix, [System.StringComparison]::OrdinalIgnoreCase)

        if ($isBlobCreated -and $isTargetBlob) {
            Write-Host "[TRIGGER] Target CSV BlobCreated event matched. Container='$ContainerName', Blob='$BlobName'."
            return $true
        }
    }

    Write-Host "[TRIGGER] No target CSV BlobCreated event matched. Expected subject ending='$targetSuffix'. Tag assignment skipped."
    return $false
}

# ------------------------------ Main ------------------------------

$functionName = "avd-tag-assignment"
$auditRows = New-Object System.Collections.Generic.List[object]
Write-Host "[INIT] Audit collection initialized. Type=$($auditRows.GetType().FullName)"

try {
    Write-Stage -Stage "START" -Message "$functionName started at $((Get-Date).ToUniversalTime().ToString('o'))."

    $azureEnvironment = Get-OptionalSetting -Name "AZURE_ENVIRONMENT" -DefaultValue "AzureUSGovernment"
    $subscriptionId = Get-RequiredSetting -Name "AZURE_SUBSCRIPTION_ID"
    $managedIdentityClientId = Get-OptionalSetting -Name "MANAGED_IDENTITY_CLIENT_ID"
    $inventoryBlob = Get-RequiredSetting -Name "INPUT_CSV_BLOB"
    $containerName = Get-RequiredSetting -Name "STORAGE_CONTAINER_NAME"
    $requestStatuses = Get-SettingList -Name "REQUEST_STATUSES" -DefaultValue "Submit,Submitted"

    $messageId = Get-ObjectPropertyValue -Object $TriggerMetadata -Names @('MessageId','messageId')
    $deliveryCount = Get-ObjectPropertyValue -Object $TriggerMetadata -Names @('DeliveryCount','deliveryCount')
    Write-Host "[TRIGGER] ServiceBusMessageId='$messageId', DeliveryCount='$deliveryCount'"
    Write-Host "[TRIGGER] Tag assignment is now Service Bus triggered from Storage BlobCreated Event Grid delivery."

    if (-not (Test-TargetCsvBlobCreatedMessage -InputObject $Message -ContainerName $containerName -BlobName $inventoryBlob)) {
        Write-Stage -Stage "END" -Message "$functionName skipped because the Service Bus message was not for the configured CSV blob."
        return
    }

    Disable-AzContextAutosave -Scope Process | Out-Null
    Write-Stage -Stage "AUTH" -Message "Connecting to $azureEnvironment using managed identity."
    if ([string]::IsNullOrWhiteSpace($managedIdentityClientId)) {
        Connect-AzAccount -Identity -Environment $azureEnvironment -ErrorAction Stop | Out-Null
    }
    else {
        Connect-AzAccount -Identity -AccountId $managedIdentityClientId -Environment $azureEnvironment -ErrorAction Stop | Out-Null
    }
    Set-AzContext -SubscriptionId $subscriptionId -ErrorAction Stop | Out-Null

    Ensure-CsvBlobExists -BlobName $inventoryBlob -Columns $CsvColumns

    $leaseId = $null
    $csvChanged = $false
    try {
        $leaseId = Acquire-BlobLease -BlobName $inventoryBlob
        Write-Stage -Stage "LEASE" -Message "Acquired CSV lease for '$inventoryBlob'."

        $csvText = Get-BlobText -BlobName $inventoryBlob
        Assert-CsvHeader -CsvText $csvText -Columns $CsvColumns -BlobName $inventoryBlob
        $rows = @(Convert-CsvTextToRows -CsvText $csvText)

        $requestRows = @($rows | Where-Object { $requestStatuses -contains (Get-RowValue -Row $_ -Column "RequestStatus") })
        Write-Host "[CSV] Total rows loaded: $($rows.Count)"
        Write-Host "[REQUEST] Submitted request rows found: $($requestRows.Count)"
        Write-Stage -Stage "CSV" -Message "Loaded $($rows.Count) row(s). Found $($requestRows.Count) submitted request row(s)."

        if ($requestRows.Count -eq 0) {
            Write-Stage -Stage "WRITE" -Message "No submitted request rows were found. CSV was not written."
        }
        else {
            foreach ($row in $requestRows) {
                $vmName = Get-RowValue -Row $row -Column "VmName"
                $vmId = Get-RowValue -Row $row -Column "VmResourceId"
                $hostPoolName = Get-RowValue -Row $row -Column "HostPoolName"
                Write-Stage -Stage "ROW" -Message "Processing request row for VM '$vmName'."

                try {
                    if ((Get-RowValue -Row $row -Column "Status") -ine "Active") { throw "CSV row Status is not Active." }
                    if ([string]::IsNullOrWhiteSpace($vmId) -or $vmId -notmatch "/providers/Microsoft.Compute/virtualMachines/") { throw "VmResourceId is missing or is not an Azure VM resource ID." }

                    $liveSessionHost = Find-LiveSessionHostForRow -Row $row
                    $liveAssignedUser = Get-SessionHostAssignedUser -SessionHost $liveSessionHost
                    if ((Get-RowValue -Row $row -Column "AssignedUser") -ne $liveAssignedUser) {
                        Set-RowValue -Row $row -Column "AssignedUser" -Value $liveAssignedUser
                        $csvChanged = $true
                    }

                    $vm = Get-AzVM -ResourceGroupName (Get-RowValue -Row $row -Column "ResourceGroup") -Name $vmName -ErrorAction Stop

                    $requestedUser = (Get-RowValue -Row $row -Column "NewAssignedUser").Trim()
                    $requestedCostCenter = (Get-RowValue -Row $row -Column "az_res_costcenter").Trim()

                    Write-Host "[REQUEST] NewAssignedUser='$requestedUser'"
                    Write-Host "[REQUEST] az_res_costcenter='$requestedCostCenter'"
                    $actions = New-Object System.Collections.Generic.List[string]
                    $azureChangesApplied = $false

                    if (-not [string]::IsNullOrWhiteSpace($requestedCostCenter)) {
                        $currentCostCenter = Get-RowValue -Row $row -Column "CostCenter"
                        $isCostCenterRemoval = Test-RemoveToken -Value $requestedCostCenter
                        $targetCostCenterForCompare = if ($isCostCenterRemoval) { "" } else { $requestedCostCenter }

                        Write-Host "[TAG] RemovalRequested='$isCostCenterRemoval' ExpectedCostCenter='$targetCostCenterForCompare'"
                        $allTagTargetsAlreadyMatch = Test-CostCenterTagTargetsMatch -Vm $vm -ExpectedCostCenter $targetCostCenterForCompare
                        if ($currentCostCenter -eq $targetCostCenterForCompare -and $allTagTargetsAlreadyMatch) {
                            $actions.Add("CostCenter already matches '$targetCostCenterForCompare' on all configured tag targets.")
                        }
                        else {
                            $tagMessage = Update-CostCenterTagTargets -Vm $vm -RequestedCostCenter $requestedCostCenter
                            Set-RowValue -Row $row -Column "CostCenter" -Value $targetCostCenterForCompare
                            $actions.Add($tagMessage)
                            $azureChangesApplied = $true
                        }
                    }

                    if (-not [string]::IsNullOrWhiteSpace($requestedUser)) {
                        $isUserRemoval = Test-RemoveToken -Value $requestedUser
                        $targetAssignedUser = if ($isUserRemoval) { $null } else { $requestedUser }

                        Write-Host "[ASSIGNMENT] RemovalRequested='$isUserRemoval' RequestedValue='$requestedUser'"

                        $currentAssignedUser = Get-RowValue -Row $row -Column "AssignedUser"
                        if ([string]::IsNullOrWhiteSpace($targetAssignedUser)) {
                            if ([string]::IsNullOrWhiteSpace($currentAssignedUser)) {
                                $actions.Add("Assigned user is already blank.")
                            }
                            else {
                                $verified = Set-AvdSessionHostAssignedUser -Row $row -LiveSessionHost $liveSessionHost -TargetAssignedUser $null
                                Set-RowValue -Row $row -Column "AssignedUser" -Value $verified
                                $actions.Add("Assigned user removed.")
                                $azureChangesApplied = $true
                            }
                        }
                        else {
                            if ($currentAssignedUser -ieq $targetAssignedUser) {
                                $actions.Add("Assigned user already matches '$targetAssignedUser'.")
                            }
                            else {
                                $verified = Set-AvdSessionHostAssignedUser -Row $row -LiveSessionHost $liveSessionHost -TargetAssignedUser $targetAssignedUser
                                Set-RowValue -Row $row -Column "AssignedUser" -Value $verified
                                $actions.Add("Assigned user set to '$verified'.")
                                $azureChangesApplied = $true
                            }
                        }
                    }

                    if ([string]::IsNullOrWhiteSpace($requestedCostCenter) -and [string]::IsNullOrWhiteSpace($requestedUser)) {
                        Set-RequestResult -Row $row -Status "Skipped" -Message "No request values provided. Enter NewAssignedUser and/or az_res_costcenter, then set RequestStatus=Submit."
                        $auditRows.Add((New-AuditRow -Action "RequestSkipped" -VmName $vmName -VmResourceId $vmId -HostPoolName $hostPoolName -Result "Skipped" -Message "No request values provided."))
                    }
                    elseif ($azureChangesApplied) {
                        Set-RowValue -Row $row -Column "LastSeenUtc" -Value ((Get-Date).ToUniversalTime().ToString("o"))
                        Set-RequestResult -Row $row -Status "Succeeded" -Message (($actions.ToArray() | Select-Object -Unique) -join " ")
                        $auditRows.Add((New-AuditRow -Action "RequestSucceeded" -VmName $vmName -VmResourceId $vmId -HostPoolName $hostPoolName -Result "Success" -Message ((($actions.ToArray() | Select-Object -Unique) -join " "))))
                    }
                    else {
                        Set-RequestResult -Row $row -Status "Skipped" -Message "No changes needed. Requested values already match current CSV/live state."
                        $auditRows.Add((New-AuditRow -Action "RequestSkipped" -VmName $vmName -VmResourceId $vmId -HostPoolName $hostPoolName -Result "Skipped" -Message "No changes needed."))
                    }

                    # Clear processed request inputs so the same request is not submitted again accidentally.
                    Set-RowValue -Row $row -Column "NewAssignedUser" -Value ""
                    Set-RowValue -Row $row -Column "az_res_costcenter" -Value ""

                    $csvChanged = $true
                }
                catch {
                    $message = $_.Exception.Message
                    Set-RequestResult -Row $row -Status "Failed" -Message $message
                    $csvChanged = $true
                    $auditRows.Add((New-AuditRow -Action "RequestFailed" -VmName $vmName -VmResourceId $vmId -HostPoolName $hostPoolName -Result "Failure" -Message $message))
                    Write-Warning "Request failed for VM '$vmName'. $message"
                }
            }

            if ($csvChanged) {
                Write-Host "[WRITE] Preparing to write $($rows.Count) inventory rows."
                Set-BlobText -BlobName $inventoryBlob -Text (Convert-RowsToCsvText -Rows $rows) -LeaseId $leaseId
                Write-Stage -Stage "WRITE" -Message "CSV updated with request processing results."
            }
            else {
                Write-Stage -Stage "WRITE" -Message "No row results changed. CSV was not written."
            }
        }
    }
    finally {
        if (-not [string]::IsNullOrWhiteSpace($leaseId)) { Release-BlobLease -BlobName $inventoryBlob -LeaseId $leaseId }
    }

    Write-Host "[AUDIT] Preparing to append $($auditRows.Count) audit row(s)."
    Append-AuditRows -AuditRows $auditRows.ToArray()
    Write-Host "[AUDIT] Audit append completed successfully."
    Write-Stage -Stage "END" -Message "$functionName completed. CsvChanged=$csvChanged."
}
catch {
    $errorMessage  = $_.Exception.Message
    $errorType     = $_.Exception.GetType().FullName
    $errorLine     = $_.InvocationInfo.ScriptLineNumber
    $errorPosition = $_.InvocationInfo.PositionMessage
    $errorStack    = $_.ScriptStackTrace

    Write-Host "============================================================"
    Write-Host "[ERROR] FunctionName=$functionName"
    Write-Host "[ERROR] Type=$errorType"
    Write-Host "[ERROR] Message=$errorMessage"
    Write-Host "[ERROR] OriginalLine=$errorLine"
    Write-Host "[ERROR] Position=$errorPosition"
    Write-Host "[ERROR] StackTrace=$errorStack"
    Write-Host "[ERROR] AuditRowsCount=$($auditRows.Count)"
    Write-Host "============================================================"

    try {
        $auditRows.Add((New-AuditRow -Action "FunctionFailed" -Result "Failure" -Message $errorMessage))
        Write-Host "[AUDIT][ERROR] Appending $($auditRows.Count) failure audit row(s)."
        Append-AuditRows -AuditRows $auditRows.ToArray()
    }
    catch {
        Write-Warning "Failed to write audit row after error. $($_.Exception.Message)"
    }

    throw
}
