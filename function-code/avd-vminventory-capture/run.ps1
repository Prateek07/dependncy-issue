param($Timer)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# ============================================================================
# Function: avd-vminventory-capture
# Runtime : Azure Functions PowerShell
# Purpose : Keep avd-vm-master.csv aligned with live AVD session host VMs.
# Cloud   : Azure Government / GCC High ready
#
# IMPORTANT:
# This script uses the exact CSV schema provided by the user:
# VmName, VmResourceId, ResourceGroup, HostPoolName, HostPoolResourceGroup,
# SessionHostName, PrivateIpAddress, AssignedUser, az_res_costcenter, VmSize, NicName,
# OsDiskName, DataDiskNames, Status, LastSeenUtc, NewAssignedUser,
# new_az_res_costcenter, RequestStatus, RequestMessage
#
# Change-aware behavior:
# - The CSV is written only when a new AVD session host VM is found, an existing
#   AVD session host VM changes, or a deleted/non-AVD row must be removed.
# - LastSeenUtc is not refreshed on every timer run. This prevents unnecessary
#   blob writes when nothing changed.
# - User/admin request columns are preserved by inventory reconciliation.
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
    "az_res_costcenter",
    "VmSize",
    "NicName",
    "OsDiskName",
    "DataDiskNames",
    "Status",
    "LastSeenUtc",
    "NewAssignedUser",
    "new_az_res_costcenter",
    "RequestStatus",
    "RequestMessage"
)

$CurrentStateColumns = @(
    "VmName",
    "VmResourceId",
    "ResourceGroup",
    "HostPoolName",
    "HostPoolResourceGroup",
    "SessionHostName",
    "PrivateIpAddress",
    "AssignedUser",
    "az_res_costcenter",
    "VmSize",
    "NicName",
    "OsDiskName",
    "DataDiskNames",
    "Status"
)

$UserRequestColumns = @(
    "NewAssignedUser",
    "new_az_res_costcenter",
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
    if ([string]::IsNullOrWhiteSpace($value)) {
        throw "Required Function App setting '$Name' is missing or empty."
    }
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
    param([Parameter(Mandatory)][string]$Name)
    $raw = Get-OptionalSetting -Name $Name
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
        if ($ErrorRecord.Exception.Response -and $ErrorRecord.Exception.Response.StatusCode) {
            return [int]$ErrorRecord.Exception.Response.StatusCode
        }
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

    if ($ExtraHeaders) {
        foreach ($key in $ExtraHeaders.Keys) { $headers[$key] = $ExtraHeaders[$key] }
    }

    if ($null -ne $BodyBytes) {
        return Invoke-WebRequest -Method $Method -Uri $Uri -Headers $headers -Body $BodyBytes -ContentType $ContentType -UseBasicParsing -ErrorAction Stop
    }

    return Invoke-WebRequest -Method $Method -Uri $Uri -Headers $headers -UseBasicParsing -ErrorAction Stop
}

function Get-BlobText {
    param([Parameter(Mandatory)][string]$BlobName)
    $uri = Get-EncodedBlobUri -BlobName $BlobName
    try {
        $response = Invoke-BlobRest -Method "GET" -Uri $uri
        return [string]$response.Content
    }
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
        $headerOnly = ($Columns -join ",") + "`r`n"
        Set-BlobText -BlobName $BlobName -Text $headerOnly
        Write-Stage -Stage "BLOB" -Message "Created missing CSV blob '$BlobName' with the required header."
        return $true
    }
    return $false
}

function Acquire-BlobLease {
    param([Parameter(Mandatory)][string]$BlobName)
    $uri = "$(Get-EncodedBlobUri -BlobName $BlobName)`?comp=lease"
    $headers = @{
        "x-ms-lease-action"   = "acquire"
        "x-ms-lease-duration" = "60"
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
    $uri = "$(Get-EncodedBlobUri -BlobName $BlobName)`?comp=lease"
    $headers = @{
        "x-ms-lease-action" = "release"
        "x-ms-lease-id"     = $LeaseId
    }
    Invoke-BlobRest -Method "PUT" -Uri $uri -ExtraHeaders $headers | Out-Null
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
    param(
        [Parameter(Mandatory)]$Row,
        [Parameter(Mandatory)][string]$Column
    )
    if ($Row.PSObject.Properties[$Column]) { return Get-StringValue -Value $Row.PSObject.Properties[$Column].Value }
    return ""
}

function Set-RowValue {
    param(
        [Parameter(Mandatory)]$Row,
        [Parameter(Mandatory)][string]$Column,
        [AllowNull()][string]$Value
    )
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
    foreach ($column in $CsvColumns) {
        if (-not [string]::IsNullOrWhiteSpace((Get-RowValue -Row $Row -Column $column))) { return $false }
    }
    return $true
}

function Convert-CsvTextToRows {
    param([string]$CsvText)
    if ([string]::IsNullOrWhiteSpace($CsvText)) { return @() }
    $rawRows = @($CsvText | ConvertFrom-Csv)
    return @($rawRows | ForEach-Object { Normalize-CsvRow -Row $_ } | Where-Object { -not (Test-EmptyCsvRow -Row $_) })
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
        FunctionName = "avd-vminventory-capture"
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

    if ($null -eq $AuditRows -or $AuditRows.Count -eq 0) {
        Write-Stage -Stage "AUDIT" -Message "No audit rows are available to append."
        return
    }

    $auditBlob = Get-OptionalSetting -Name "STATUS_CSV_BLOB" -DefaultValue "state/avd-vm-processing-status.csv"
    Write-Stage -Stage "AUDIT" -Message "Preparing to append $($AuditRows.Count) audit row(s) to '$auditBlob'."

    Ensure-CsvBlobExists -BlobName $auditBlob -Columns $AuditColumns | Out-Null
    $leaseId = $null
    try {
        $leaseId = Acquire-BlobLease -BlobName $auditBlob
        Write-Stage -Stage "AUDIT" -Message "Acquired lease for audit blob '$auditBlob'."

        $existingText = Get-BlobText -BlobName $auditBlob
        $existingRows = @()
        if (-not [string]::IsNullOrWhiteSpace($existingText)) {
            $existingRows = @($existingText | ConvertFrom-Csv)
        }

        Write-Stage -Stage "AUDIT" -Message "ExistingAuditRows=$($existingRows.Count); NewAuditRows=$($AuditRows.Count)."
        $allRows = @($existingRows + $AuditRows)
        Set-BlobText -BlobName $auditBlob -Text (Convert-AuditRowsToCsvText -Rows $allRows) -LeaseId $leaseId
        Write-Stage -Stage "AUDIT" -Message "Audit blob '$auditBlob' updated successfully. TotalAuditRows=$($allRows.Count)."
    }
    finally {
        if (-not [string]::IsNullOrWhiteSpace($leaseId)) {
            Release-BlobLease -BlobName $auditBlob -LeaseId $leaseId
            Write-Stage -Stage "AUDIT" -Message "Released lease for audit blob '$auditBlob'."
        }
    }
}

function Get-ResourceGroupFromResourceId {
    param([string]$ResourceId)
    if ($ResourceId -match "/resourceGroups/([^/]+)/") { return $matches[1] }
    return ""
}

function Get-ResourceNameFromResourceId {
    param([string]$ResourceId)
    if ([string]::IsNullOrWhiteSpace($ResourceId)) { return "" }
    return ($ResourceId -split "/")[-1]
}

function Get-HostPoolResourceGroupFromId {
    param([string]$HostPoolId)
    return Get-ResourceGroupFromResourceId -ResourceId $HostPoolId
}

function Get-HostPoolNameFromObject {
    param([Parameter(Mandatory)]$HostPool)
    if (-not [string]::IsNullOrWhiteSpace($HostPool.Name)) { return ($HostPool.Name -split "/")[-1] }
    return Get-ResourceNameFromResourceId -ResourceId $HostPool.Id
}

function Get-SessionHostResourceName {
    param([Parameter(Mandatory)]$SessionHost)
    return (($SessionHost.Name -split "/")[-1])
}

function Get-SessionHostVmName {
    param([Parameter(Mandatory)]$SessionHost)
    $leaf = Get-SessionHostResourceName -SessionHost $SessionHost
    return (($leaf -split "\.")[0])
}

function Get-SessionHostAssignedUser {
    param([Parameter(Mandatory)]$SessionHost)
    if ($SessionHost.PSObject.Properties["AssignedUser"]) { return Get-StringValue -Value $SessionHost.AssignedUser }
    if ($SessionHost.PSObject.Properties["Properties"] -and $SessionHost.Properties.PSObject.Properties["AssignedUser"]) {
        return Get-StringValue -Value $SessionHost.Properties.AssignedUser
    }
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

function Test-AllowedHostPool {
    param(
        [string]$HostPoolName,
        [string]$HostPoolResourceGroup
    )
    $allowedNames = Get-SettingList -Name "HOST_POOL_NAMES"
    $allowedRgs = Get-SettingList -Name "HOST_POOL_RESOURCE_GROUPS"
    if ($allowedNames.Count -gt 0 -and ($allowedNames -notcontains $HostPoolName)) { return $false }
    if ($allowedRgs.Count -gt 0 -and ($allowedRgs -notcontains $HostPoolResourceGroup)) { return $false }
    return $true
}

function Test-AllowedVmNamePrefix {
    param([string]$VmName)
    $prefixes = Get-SettingList -Name "AVD_VM_NAME_PREFIXES"
    if ($prefixes.Count -eq 0) { return $true }
    foreach ($prefix in $prefixes) {
        if ($VmName.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) { return $true }
    }
    return $false
}

function Get-PrimaryNicInfo {
    param([Parameter(Mandatory)]$Vm)
    $nicRefs = @($Vm.NetworkProfile.NetworkInterfaces)
    if ($nicRefs.Count -eq 0) { return [pscustomobject]@{ Id=""; Name=""; PrivateIpAddress="" } }

    $primaryNicRef = $nicRefs | Where-Object { $_.Primary -eq $true } | Select-Object -First 1
    if ($null -eq $primaryNicRef) { $primaryNicRef = $nicRefs[0] }
    $nicId = Get-StringValue -Value $primaryNicRef.Id
    if ([string]::IsNullOrWhiteSpace($nicId)) { return [pscustomobject]@{ Id=""; Name=""; PrivateIpAddress="" } }

    try {
        $nicResponse = Invoke-AzRestMethod -Method GET -Path "$nicId`?api-version=2023-09-01" -ErrorAction Stop
        $nicJson = $nicResponse.Content | ConvertFrom-Json
        $privateIp = ""
        foreach ($ipConfig in @($nicJson.properties.ipConfigurations)) {
            $candidateIp = Get-StringValue -Value $ipConfig.properties.privateIPAddress
            if ($ipConfig.properties.primary -eq $true -or [string]::IsNullOrWhiteSpace($privateIp)) { $privateIp = $candidateIp }
        }
        return [pscustomobject]@{ Id=$nicId; Name=(Get-ResourceNameFromResourceId -ResourceId $nicId); PrivateIpAddress=$privateIp }
    }
    catch {
        Write-Warning "NIC lookup failed for '$nicId'. Error: $($_.Exception.Message)"
        return [pscustomobject]@{ Id=$nicId; Name=(Get-ResourceNameFromResourceId -ResourceId $nicId); PrivateIpAddress="" }
    }
}

function Get-CostCenterFromVmTags {
    param([Parameter(Mandatory)]$Vm)
    if ($null -eq $Vm.Tags) { return "" }
    foreach ($key in $Vm.Tags.Keys) {
        if ($key -ieq "az_res_costcenter") { return Get-StringValue -Value $Vm.Tags[$key] }
    }
    return ""
}

function Find-VmForSessionHost {
    param(
        [Parameter(Mandatory)]$SessionHost,
        [Parameter(Mandatory)][object[]]$AllVms
    )

    $vmResourceIdFromSessionHost = Get-SessionHostVmResourceId -SessionHost $SessionHost
    if (-not [string]::IsNullOrWhiteSpace($vmResourceIdFromSessionHost)) {
        $vmRg = Get-ResourceGroupFromResourceId -ResourceId $vmResourceIdFromSessionHost
        $vmName = Get-ResourceNameFromResourceId -ResourceId $vmResourceIdFromSessionHost
        try { return Get-AzVM -ResourceGroupName $vmRg -Name $vmName -ErrorAction Stop }
        catch { throw "Backing VM '$vmResourceIdFromSessionHost' was referenced by AVD session host but could not be read. $($_.Exception.Message)" }
    }

    $sessionVmName = Get-SessionHostVmName -SessionHost $SessionHost
    $candidates = @($AllVms | Where-Object { $_.Name -ieq $sessionVmName })
    if ($candidates.Count -eq 1) { return $candidates[0] }
    if ($candidates.Count -gt 1) { throw "Multiple Azure VMs named '$sessionVmName' were found. The session host did not expose a VM resource ID, so the script cannot safely choose one." }
    throw "No Azure VM was found for AVD session host '$($SessionHost.Name)'."
}

function New-DiscoveredInventoryRow {
    param(
        [Parameter(Mandatory)]$Vm,
        [Parameter(Mandatory)]$SessionHost,
        [Parameter(Mandatory)][string]$HostPoolName,
        [Parameter(Mandatory)][string]$HostPoolResourceGroup,
        [Parameter(Mandatory)][string]$NowUtc
    )

    $nicInfo = Get-PrimaryNicInfo -Vm $Vm
    $dataDiskNames = @($Vm.StorageProfile.DataDisks | ForEach-Object { Get-StringValue -Value $_.Name } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })

    $row = New-EmptyCsvRow
    Set-RowValue -Row $row -Column "VmName" -Value $Vm.Name
    Set-RowValue -Row $row -Column "VmResourceId" -Value $Vm.Id
    Set-RowValue -Row $row -Column "ResourceGroup" -Value $Vm.ResourceGroupName
    Set-RowValue -Row $row -Column "HostPoolName" -Value $HostPoolName
    Set-RowValue -Row $row -Column "HostPoolResourceGroup" -Value $HostPoolResourceGroup
    Set-RowValue -Row $row -Column "SessionHostName" -Value $SessionHost.Name
    Set-RowValue -Row $row -Column "PrivateIpAddress" -Value $nicInfo.PrivateIpAddress
    Set-RowValue -Row $row -Column "AssignedUser" -Value (Get-SessionHostAssignedUser -SessionHost $SessionHost)
    Set-RowValue -Row $row -Column "az_res_costcenter" -Value (Get-CostCenterFromVmTags -Vm $Vm)
    Set-RowValue -Row $row -Column "VmSize" -Value $Vm.HardwareProfile.VmSize
    Set-RowValue -Row $row -Column "NicName" -Value $nicInfo.Name
    Set-RowValue -Row $row -Column "OsDiskName" -Value $Vm.StorageProfile.OsDisk.Name
    Set-RowValue -Row $row -Column "DataDiskNames" -Value ($dataDiskNames -join ";")
    Set-RowValue -Row $row -Column "Status" -Value "Active"
    Set-RowValue -Row $row -Column "LastSeenUtc" -Value $NowUtc
    return $row
}

function Test-CurrentStateChanged {
    param(
        [Parameter(Mandatory)]$ExistingRow,
        [Parameter(Mandatory)]$DiscoveredRow
    )
    foreach ($column in $CurrentStateColumns) {
        if ((Get-RowValue -Row $ExistingRow -Column $column) -ne (Get-RowValue -Row $DiscoveredRow -Column $column)) { return $true }
    }
    return $false
}

function Merge-DiscoveredWithExistingRow {
    param(
        [Parameter(Mandatory)]$ExistingRow,
        [Parameter(Mandatory)]$DiscoveredRow,
        [Parameter(Mandatory)][bool]$CurrentStateChanged
    )
    $merged = Normalize-CsvRow -Row $DiscoveredRow
    foreach ($column in $UserRequestColumns) {
        Set-RowValue -Row $merged -Column $column -Value (Get-RowValue -Row $ExistingRow -Column $column)
    }
    if (-not $CurrentStateChanged) {
        Set-RowValue -Row $merged -Column "LastSeenUtc" -Value (Get-RowValue -Row $ExistingRow -Column "LastSeenUtc")
    }
    return $merged
}

# ------------------------------ Main ------------------------------

$functionName = "avd-vminventory-capture"
$nowUtc = (Get-Date).ToUniversalTime().ToString("o")
$auditRows = New-Object System.Collections.Generic.List[object]

try {
    Write-Stage -Stage "START" -Message "$functionName started at $nowUtc."

    $azureEnvironment = Get-OptionalSetting -Name "AZURE_ENVIRONMENT" -DefaultValue "AzureUSGovernment"
    $subscriptionId = Get-RequiredSetting -Name "AZURE_SUBSCRIPTION_ID"
    $managedIdentityClientId = Get-OptionalSetting -Name "MANAGED_IDENTITY_CLIENT_ID"
    $inventoryBlob = Get-RequiredSetting -Name "INPUT_CSV_BLOB"

    Disable-AzContextAutosave -Scope Process | Out-Null
    Write-Stage -Stage "AUTH" -Message "Connecting to $azureEnvironment using managed identity."
    if ([string]::IsNullOrWhiteSpace($managedIdentityClientId)) {
        Connect-AzAccount -Identity -Environment $azureEnvironment -ErrorAction Stop | Out-Null
    }
    else {
        Connect-AzAccount -Identity -AccountId $managedIdentityClientId -Environment $azureEnvironment -ErrorAction Stop | Out-Null
    }
    Set-AzContext -SubscriptionId $subscriptionId -ErrorAction Stop | Out-Null
    Write-Stage -Stage "AUTH" -Message "Managed identity authentication completed and Azure context set to subscription '$subscriptionId'."

    Write-Stage -Stage "CONFIG" -Message "InputCsvBlob=$inventoryBlob; StorageAccount=$(Get-RequiredSetting -Name 'STORAGE_ACCOUNT_NAME'); Container=$(Get-RequiredSetting -Name 'STORAGE_CONTAINER_NAME')."
    Ensure-CsvBlobExists -BlobName $inventoryBlob -Columns $CsvColumns | Out-Null

    Write-Stage -Stage "DISCOVERY" -Message "Loading AVD host pools and Azure VMs."
    $allVms = @(Get-AzVM -ErrorAction Stop)
    Write-Stage -Stage "DISCOVERY" -Message "Loaded $($allVms.Count) VM(s) from subscription '$subscriptionId'."

    $hostPoolResourceGroups = Get-SettingList -Name "HOST_POOL_RESOURCE_GROUPS"
    if ($hostPoolResourceGroups.Count -gt 0) {
        Write-Stage -Stage "CONFIG" -Message "Host pool discovery is restricted to resource group(s): $($hostPoolResourceGroups -join ', ')."
    }
    else {
        Write-Stage -Stage "CONFIG" -Message "HOST_POOL_RESOURCE_GROUPS is empty. Host pools will be discovered across the subscription."
    }

    if ($hostPoolResourceGroups.Count -gt 0) {
        $hostPools = @()
        foreach ($rg in $hostPoolResourceGroups) {
            $hostPools += @(Get-AzWvdHostPool -ResourceGroupName $rg -SubscriptionId $subscriptionId -ErrorAction Stop)
        }
    }
    else {
        $hostPools = @(Get-AzWvdHostPool -SubscriptionId $subscriptionId -ErrorAction Stop)
    }

    Write-Stage -Stage "DISCOVERY" -Message "Loaded $($hostPools.Count) host pool(s) before applying host-pool filters."

    $discoveredRows = New-Object System.Collections.Generic.List[object]
    $seenVmIds = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

    foreach ($hostPool in $hostPools) {
        $hostPoolName = Get-HostPoolNameFromObject -HostPool $hostPool
        $hostPoolRg = Get-HostPoolResourceGroupFromId -HostPoolId $hostPool.Id

        if (-not (Test-AllowedHostPool -HostPoolName $hostPoolName -HostPoolResourceGroup $hostPoolRg)) {
            Write-Stage -Stage "FILTER" -Message "Skipping host pool '$hostPoolName' in '$hostPoolRg' because it does not match HOST_POOL_NAMES/HOST_POOL_RESOURCE_GROUPS."
            continue
        }

        Write-Stage -Stage "HOSTPOOL" -Message "Reading session hosts from host pool '$hostPoolName' in resource group '$hostPoolRg'."
        $sessionHosts = @(Get-AzWvdSessionHost -ResourceGroupName $hostPoolRg -HostPoolName $hostPoolName -SubscriptionId $subscriptionId -ErrorAction Stop)
        Write-Stage -Stage "HOSTPOOL" -Message "Host pool '$hostPoolName' returned $($sessionHosts.Count) session host(s)."

        foreach ($sessionHost in $sessionHosts) {
            $sessionVmName = Get-SessionHostVmName -SessionHost $sessionHost
            if (-not (Test-AllowedVmNamePrefix -VmName $sessionVmName)) {
                Write-Stage -Stage "FILTER" -Message "Skipping VM '$sessionVmName' because it does not match AVD_VM_NAME_PREFIXES."
                continue
            }

            try {
                $vm = Find-VmForSessionHost -SessionHost $sessionHost -AllVms $allVms
                $row = New-DiscoveredInventoryRow -Vm $vm -SessionHost $sessionHost -HostPoolName $hostPoolName -HostPoolResourceGroup $hostPoolRg -NowUtc $nowUtc
                [void]$seenVmIds.Add($vm.Id)
                $discoveredRows.Add($row)
                Write-Stage -Stage "VM" -Message "Discovered VM '$($vm.Name)' in resource group '$($vm.ResourceGroupName)' for host pool '$hostPoolName'."
            }
            catch {
                $message = $_.Exception.Message
                Write-Warning $message
                $auditRows.Add((New-AuditRow -Action "SessionHostVmLookupFailed" -VmName $sessionVmName -HostPoolName $hostPoolName -Result "Warning" -Message $message))
            }
        }
    }

    Write-Stage -Stage "DISCOVERY" -Message "Discovered $($discoveredRows.Count) live AVD session host VM row(s)."

    $leaseId = $null
    $csvChanged = $false
    try {
        $leaseId = Acquire-BlobLease -BlobName $inventoryBlob
        Write-Stage -Stage "LEASE" -Message "Acquired CSV lease for '$inventoryBlob'."

        $csvText = Get-BlobText -BlobName $inventoryBlob
        Assert-CsvHeader -CsvText $csvText -Columns $CsvColumns -BlobName $inventoryBlob
        $existingRows = @(Convert-CsvTextToRows -CsvText $csvText)
        Write-Stage -Stage "CSV" -Message "Loaded $($existingRows.Count) existing inventory row(s) from '$inventoryBlob'."

        $existingByVmId = @{}
        foreach ($row in $existingRows) {
            $id = Get-RowValue -Row $row -Column "VmResourceId"
            if (-not [string]::IsNullOrWhiteSpace($id)) { $existingByVmId[$id.ToLowerInvariant()] = $row }
        }

        $outputRows = New-Object System.Collections.Generic.List[object]

        foreach ($discovered in $discoveredRows) {
            $vmId = Get-RowValue -Row $discovered -Column "VmResourceId"
            $key = $vmId.ToLowerInvariant()
            if ($existingByVmId.ContainsKey($key)) {
                $existing = $existingByVmId[$key]
                $currentChanged = Test-CurrentStateChanged -ExistingRow $existing -DiscoveredRow $discovered
                $merged = Merge-DiscoveredWithExistingRow -ExistingRow $existing -DiscoveredRow $discovered -CurrentStateChanged $currentChanged
                $outputRows.Add($merged)

                if ($currentChanged) {
                    $csvChanged = $true
                    $changedVmName = Get-RowValue -Row $merged -Column "VmName"
                    Write-Stage -Stage "RECONCILE" -Message "Inventory change detected for VM '$changedVmName'. The CSV row will be updated."
                    $auditRows.Add((New-AuditRow -Action "InventoryUpdated" -VmName $changedVmName -VmResourceId $vmId -HostPoolName (Get-RowValue -Row $merged -Column "HostPoolName") -Result "Success" -Message "One or more current-state fields changed."))
                }
                else {
                    $unchangedVmName = Get-RowValue -Row $merged -Column "VmName"
                    Write-Stage -Stage "RECONCILE" -Message "No current-state change detected for VM '$unchangedVmName'."
                }
            }
            else {
                $csvChanged = $true
                $outputRows.Add($discovered)
                $newVmName = Get-RowValue -Row $discovered -Column "VmName"
                Write-Stage -Stage "RECONCILE" -Message "New VM '$newVmName' will be added to the inventory CSV."
                $auditRows.Add((New-AuditRow -Action "InventoryAdded" -VmName $newVmName -VmResourceId $vmId -HostPoolName (Get-RowValue -Row $discovered -Column "HostPoolName") -Result "Success" -Message "New AVD session host VM added to CSV."))
            }
        }

        foreach ($existing in $existingRows) {
            $existingVmId = Get-RowValue -Row $existing -Column "VmResourceId"
            if ([string]::IsNullOrWhiteSpace($existingVmId)) { continue }
            if (-not $seenVmIds.Contains($existingVmId)) {
                $csvChanged = $true
                $removedVmName = Get-RowValue -Row $existing -Column "VmName"
                Write-Stage -Stage "RECONCILE" -Message "VM '$removedVmName' was not rediscovered and its row will be removed from the inventory CSV."
                $auditRows.Add((New-AuditRow -Action "InventoryRemoved" -VmName $removedVmName -VmResourceId $existingVmId -HostPoolName (Get-RowValue -Row $existing -Column "HostPoolName") -Result "Success" -Message "Row removed because the VM is no longer a live AVD session host discovered by this automation."))
            }
        }

        Write-Stage -Stage "RECONCILE" -Message "Reconciliation completed. OutputRows=$($outputRows.Count); AuditRows=$($auditRows.Count); CsvChanged=$csvChanged."

        if ($csvChanged) {
            Write-Stage -Stage "WRITE" -Message "Converting $($outputRows.Count) output row(s) to CSV text."
            Set-BlobText -BlobName $inventoryBlob -Text (Convert-RowsToCsvText -Rows $outputRows.ToArray()) -LeaseId $leaseId
            Write-Stage -Stage "WRITE" -Message "Inventory CSV '$inventoryBlob' updated because real inventory changes were detected."
        }
        else {
            Write-Stage -Stage "WRITE" -Message "No inventory changes detected. CSV was not written."
        }
    }
    finally {
        if (-not [string]::IsNullOrWhiteSpace($leaseId)) {
            Release-BlobLease -BlobName $inventoryBlob -LeaseId $leaseId
            Write-Stage -Stage "LEASE" -Message "Released CSV lease for '$inventoryBlob'."
        }
    }

    Write-Stage -Stage "AUDIT" -Message "Sending $($auditRows.Count) audit row(s) to the status CSV."
    Append-AuditRows -AuditRows $auditRows.ToArray()
    Write-Stage -Stage "END" -Message "$functionName completed. CsvChanged=$csvChanged; DiscoveredRows=$($discoveredRows.Count); AuditRows=$($auditRows.Count)."
}
catch {
    $errorMessage = $_.Exception.Message
    $errorLine = $_.InvocationInfo.ScriptLineNumber
    $errorPosition = $_.InvocationInfo.PositionMessage
    $errorStack = $_.ScriptStackTrace

    Write-Host "[ERROR] FunctionName=$functionName"
    Write-Host "[ERROR] Message=$errorMessage"
    Write-Host "[ERROR] OriginalLine=$errorLine"
    Write-Host "[ERROR] Position=$errorPosition"
    Write-Host "[ERROR] StackTrace=$errorStack"

    Write-Error "$functionName failed. $errorMessage"
    try {
        $auditRows.Add((New-AuditRow -Action "FunctionFailed" -Result "Failure" -Message "Line $errorLine. $errorMessage"))
        Write-Stage -Stage "AUDIT" -Message "Attempting to write failure audit row(s). Count=$($auditRows.Count)."
        Append-AuditRows -AuditRows $auditRows.ToArray()
    }
    catch {
        Write-Warning "Failed to write audit row after error. $($_.Exception.Message)"
    }
    throw
}
