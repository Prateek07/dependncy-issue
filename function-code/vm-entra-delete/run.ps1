param(
    [Parameter(Mandatory = $true)]
    $Message,

    $TriggerMetadata
)

$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$ProgressPreference = 'SilentlyContinue'

function Write-LogInfo {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Message
    )

    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    Write-Host "[$timestamp] [INFO] $Message"
}

function Write-LogWarning {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Message
    )

    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    Write-Host "[$timestamp] [WARN] $Message"
    Write-Warning $Message
}

function Write-LogError {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Message
    )

    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
    Write-Host "[$timestamp] [ERROR] $Message"
}

function Get-AppSetting {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [string] $DefaultValue = $null,

        [switch] $Required
    )

    $value = [Environment]::GetEnvironmentVariable($Name)

    if ([string]::IsNullOrWhiteSpace($value)) {
        if ($Required) {
            throw "Missing required app setting: $Name"
        }

        return $DefaultValue
    }

    return $value.Trim()
}

function Get-BoolAppSetting {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [bool] $DefaultValue
    )

    $raw = Get-AppSetting -Name $Name -DefaultValue $null

    if ([string]::IsNullOrWhiteSpace($raw)) {
        return $DefaultValue
    }

    switch -Regex ($raw.Trim().ToLowerInvariant()) {
        '^(true|1|yes|y)$' {
            return $true
        }
        '^(false|0|no|n)$' {
            return $false
        }
        default {
            throw "Invalid boolean app setting '$Name'. Value='$raw'. Use true or false."
        }
    }
}

function Get-IntAppSetting {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [int] $DefaultValue
    )

    $raw = Get-AppSetting -Name $Name -DefaultValue $null

    if ([string]::IsNullOrWhiteSpace($raw)) {
        return $DefaultValue
    }

    [int] $parsed = 0

    if (-not [int]::TryParse($raw, [ref] $parsed)) {
        throw "Invalid integer app setting '$Name'. Value='$raw'."
    }

    return $parsed
}

function ConvertTo-QueryString {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable] $Query
    )

    $pairs = @()

    foreach ($key in $Query.Keys) {
        $value = $Query[$key]

        if ($null -eq $value) {
            continue
        }

        if ([string]::IsNullOrWhiteSpace([string] $value)) {
            continue
        }

        $encodedKey = [Uri]::EscapeDataString([string] $key)
        $encodedValue = [Uri]::EscapeDataString([string] $value)

        $pairs += "$encodedKey=$encodedValue"
    }

    return ($pairs -join '&')
}

function Escape-ODataString {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Value
    )

    return $Value.Replace("'", "''")
}

function Get-PropertyValue {
    param(
        $Object,

        [Parameter(Mandatory = $true)]
        [string[]] $Names
    )

    if ($null -eq $Object) {
        return $null
    }

    if ($Object -is [System.Collections.IDictionary]) {
        foreach ($name in $Names) {
            if ($Object.Contains($name)) {
                return $Object[$name]
            }

            foreach ($key in $Object.Keys) {
                if (([string] $key).Equals($name, [System.StringComparison]::OrdinalIgnoreCase)) {
                    return $Object[$key]
                }
            }
        }
    }

    foreach ($name in $Names) {
        $property = $Object.PSObject.Properties[$name]

        if ($null -ne $property) {
            return $property.Value
        }
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

function ConvertTo-MessageText {
    param(
        [Parameter(Mandatory = $true)]
        $InputObject
    )

    if ($InputObject -is [byte[]]) {
        return [System.Text.Encoding]::UTF8.GetString($InputObject)
    }

    if ($InputObject -is [string]) {
        return $InputObject
    }

    return ($InputObject | ConvertTo-Json -Depth 100 -Compress)
}

function ConvertFrom-MessageText {
    param(
        [Parameter(Mandatory = $true)]
        [string] $MessageText
    )

    if ([string]::IsNullOrWhiteSpace($MessageText)) {
        throw 'Service Bus message body is empty.'
    }

    try {
        $json = $MessageText | ConvertFrom-Json -Depth 100
    }
    catch {
        throw "Failed to parse Service Bus message body as JSON. Error='$($_.Exception.Message)'"
    }

    if ($json -is [array]) {
        return @($json)
    }

    return @($json)
}

function Parse-AzureVmResourceId {
    param(
        [Parameter(Mandatory = $true)]
        [string] $ResourceId
    )

    $cleanResourceId = $ResourceId.Trim().TrimEnd('/')
    $pattern = '(?i)^/subscriptions/([^/]+)/resourceGroups/([^/]+)/providers/Microsoft\.Compute/virtualMachines/([^/]+)$'

    if ($cleanResourceId -notmatch $pattern) {
        return $null
    }

    return [pscustomobject]@{
        SubscriptionId = $Matches[1]
        ResourceGroup  = $Matches[2]
        VmName         = [Uri]::UnescapeDataString($Matches[3])
        ResourceId     = $cleanResourceId
    }
}

function Get-NameCandidates {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name
    )

    $ordered = [ordered] @{}

    foreach ($candidate in @($Name, $Name.ToUpperInvariant(), $Name.ToLowerInvariant())) {
        if ([string]::IsNullOrWhiteSpace($candidate)) {
            continue
        }

        $key = $candidate.ToLowerInvariant()

        if (-not $ordered.Contains($key)) {
            $ordered[$key] = $candidate
        }
    }

    return @($ordered.Values)
}

function Add-UniqueObjectById {
    param(
        [AllowEmptyCollection()]
        [object[]] $Items = @(),

        [Parameter(Mandatory = $true)]
        [string] $IdProperty
    )

    $map = @{}

    foreach ($item in @($Items)) {
        if ($null -eq $item) {
            continue
        }

        $id = [string] $item.$IdProperty

        if ([string]::IsNullOrWhiteSpace($id)) {
            continue
        }

        $map[$id] = $item
    }

    return @($map.Values)
}

function Get-GraphResourceFromBaseUri {
    param(
        [Parameter(Mandatory = $true)]
        [string] $BaseUri
    )

    try {
        $uri = [Uri] $BaseUri
        return "$($uri.Scheme)://$($uri.Host)/"
    }
    catch {
        return 'https://graph.microsoft.us/'
    }
}

function Initialize-Settings {
    $script:TargetSubscriptionId = (Get-AppSetting -Name 'AZURE_SUBSCRIPTION_ID' -Required).ToLowerInvariant()
    $script:ManagedIdentityClientId = Get-AppSetting -Name 'MANAGED_IDENTITY_CLIENT_ID' -DefaultValue $null

    $script:DryRun = Get-BoolAppSetting -Name 'DRY_RUN' -DefaultValue $true
    $script:DeleteEntraDevice = Get-BoolAppSetting -Name 'DELETE_ENTRA_DEVICE' -DefaultValue $true
    $script:AllowAllVmNamesInSubscription = Get-BoolAppSetting -Name 'ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION' -DefaultValue $false
    $script:MaxMatchesToDelete = Get-IntAppSetting -Name 'MAX_MATCHES_TO_DELETE' -DefaultValue 1

    if ($script:MaxMatchesToDelete -lt 1) {
        throw 'MAX_MATCHES_TO_DELETE must be 1 or greater.'
    }

    if (-not $script:AllowAllVmNamesInSubscription) {
        throw 'Safety guard missing. Set ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION=true to allow vm-entra-delete to process VM delete events in the configured subscription.'
    }

    $graphRootDefault = Get-AppSetting -Name 'GRAPH_ROOT' -DefaultValue 'https://graph.microsoft.us/v1.0'
    $script:GraphBaseUri = (Get-AppSetting -Name 'GRAPH_BASE_URI' -DefaultValue $graphRootDefault).TrimEnd('/')

    $graphResourceDefault = Get-GraphResourceFromBaseUri -BaseUri $script:GraphBaseUri
    $script:GraphResource = Get-AppSetting -Name 'GRAPH_RESOURCE' -DefaultValue $graphResourceDefault
    $script:GraphResource = $script:GraphResource.TrimEnd('/') + '/'

    $script:GraphTimeoutSeconds = Get-IntAppSetting -Name 'GRAPH_REQUEST_TIMEOUT_SECONDS' -DefaultValue 60
    $script:GraphRetryMaxAttempts = Get-IntAppSetting -Name 'GRAPH_RETRY_MAX_ATTEMPTS' -DefaultValue 3

    if ($script:GraphRetryMaxAttempts -lt 1) {
        $script:GraphRetryMaxAttempts = 1
    }

    Write-LogInfo "Using app setting AZURE_SUBSCRIPTION_ID='$script:TargetSubscriptionId'."
    Write-LogInfo "Settings: DRY_RUN='$script:DryRun', DELETE_ENTRA_DEVICE='$script:DeleteEntraDevice', ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION='$script:AllowAllVmNamesInSubscription', MAX_MATCHES_TO_DELETE='$script:MaxMatchesToDelete'."
    Write-LogInfo "Graph settings: GRAPH_BASE_URI='$script:GraphBaseUri', GRAPH_RESOURCE='$script:GraphResource'."

    if (-not [string]::IsNullOrWhiteSpace($script:ManagedIdentityClientId)) {
        Write-LogInfo 'Using user-assigned managed identity client id.'
    }
    else {
        Write-LogInfo 'MANAGED_IDENTITY_CLIENT_ID not configured. Using system-assigned managed identity.'
    }
}

function Get-GraphAccessToken {
    $nowUtc = (Get-Date).ToUniversalTime()

    if (
        -not [string]::IsNullOrWhiteSpace($script:GraphAccessToken) -and
        $null -ne $script:GraphAccessTokenExpiresOnUtc -and
        $script:GraphAccessTokenExpiresOnUtc -gt $nowUtc.AddMinutes(5)
    ) {
        Write-LogInfo 'Using cached Microsoft Graph access token.'
        return $script:GraphAccessToken
    }

    Write-LogInfo "Requesting Microsoft Graph access token using managed identity. Resource='$script:GraphResource'"

    if (-not [string]::IsNullOrWhiteSpace($env:IDENTITY_ENDPOINT) -and -not [string]::IsNullOrWhiteSpace($env:IDENTITY_HEADER)) {
        $query = @{
            'api-version' = '2019-08-01'
            'resource'    = $script:GraphResource
        }

        if (-not [string]::IsNullOrWhiteSpace($script:ManagedIdentityClientId)) {
            $query['client_id'] = $script:ManagedIdentityClientId
        }

        $uri = "$($env:IDENTITY_ENDPOINT)?$(ConvertTo-QueryString -Query $query)"
        $headers = @{
            'X-IDENTITY-HEADER' = $env:IDENTITY_HEADER
        }

        $tokenResponse = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -TimeoutSec $script:GraphTimeoutSeconds
    }
    elseif (-not [string]::IsNullOrWhiteSpace($env:MSI_ENDPOINT) -and -not [string]::IsNullOrWhiteSpace($env:MSI_SECRET)) {
        $query = @{
            'resource' = $script:GraphResource
        }

        if (-not [string]::IsNullOrWhiteSpace($script:ManagedIdentityClientId)) {
            $query['clientid'] = $script:ManagedIdentityClientId
        }

        $uri = "$($env:MSI_ENDPOINT)?$(ConvertTo-QueryString -Query $query)"
        $headers = @{
            'Secret' = $env:MSI_SECRET
        }

        $tokenResponse = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -TimeoutSec $script:GraphTimeoutSeconds
    }
    else {
        throw 'Managed identity endpoint environment variables were not found. Confirm managed identity is enabled on the Function App.'
    }

    if ([string]::IsNullOrWhiteSpace($tokenResponse.access_token)) {
        throw 'Managed identity token response did not contain access_token.'
    }

    $script:GraphAccessToken = $tokenResponse.access_token
    $expiresOnUtc = $nowUtc.AddMinutes(45)

    if (-not [string]::IsNullOrWhiteSpace([string] $tokenResponse.expires_on)) {
        [long] $epochSeconds = 0

        if ([long]::TryParse([string] $tokenResponse.expires_on, [ref] $epochSeconds)) {
            $expiresOnUtc = [DateTimeOffset]::FromUnixTimeSeconds($epochSeconds).UtcDateTime
        }
    }
    elseif (-not [string]::IsNullOrWhiteSpace([string] $tokenResponse.expires_in)) {
        [int] $expiresInSeconds = 2700

        if ([int]::TryParse([string] $tokenResponse.expires_in, [ref] $expiresInSeconds)) {
            $expiresOnUtc = $nowUtc.AddSeconds($expiresInSeconds)
        }
    }

    $script:GraphAccessTokenExpiresOnUtc = $expiresOnUtc

    Write-LogInfo "Microsoft Graph access token acquired. ExpiresOnUtc='$expiresOnUtc'"

    return $script:GraphAccessToken
}

function Get-GraphErrorDetails {
    param(
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.ErrorRecord] $ErrorRecord,

        [Parameter(Mandatory = $true)]
        [string] $Method,

        [Parameter(Mandatory = $true)]
        [string] $Uri
    )

    $statusCode = $null
    $responseBody = $ErrorRecord.ErrorDetails.Message
    $graphCode = $null
    $graphMessage = $null

    if ($null -ne $ErrorRecord.Exception.Response) {
        try {
            $statusCode = [int] $ErrorRecord.Exception.Response.StatusCode.value__
        }
        catch {
            try {
                $statusCode = [int] $ErrorRecord.Exception.Response.StatusCode
            }
            catch {
                $statusCode = $null
            }
        }
    }

    if ([string]::IsNullOrWhiteSpace($responseBody)) {
        $responseBody = ''
    }

    try {
        $parsedError = $responseBody | ConvertFrom-Json -Depth 20

        if ($null -ne $parsedError.error) {
            $graphCode = [string] $parsedError.error.code
            $graphMessage = [string] $parsedError.error.message
        }
    }
    catch {
        $graphCode = $null
        $graphMessage = $null
    }

    return [pscustomobject] @{
        Method        = $Method
        Uri           = $Uri
        StatusCode    = $statusCode
        GraphCode     = $graphCode
        GraphMessage  = $graphMessage
        ExceptionText = $ErrorRecord.Exception.Message
        Body          = $responseBody
    }
}

function Format-GraphErrorMessage {
    param(
        [Parameter(Mandatory = $true)]
        $Details
    )

    return "Graph request failed. Method='$($Details.Method)', Uri='$($Details.Uri)', StatusCode='$($Details.StatusCode)', GraphCode='$($Details.GraphCode)', GraphMessage='$($Details.GraphMessage)', Error='$($Details.ExceptionText)', Body='$($Details.Body)'"
}

function Test-IsTransientStatusCode {
    param($StatusCode)

    if ($null -eq $StatusCode) {
        return $false
    }

    [int] $code = [int] $StatusCode

    if ($code -eq 408 -or $code -eq 429 -or $code -ge 500) {
        return $true
    }

    return $false
}


function Test-IsGraphPermissionOrAuthError {
    param(
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.ErrorRecord] $ErrorRecord
    )

    $message = [string] $ErrorRecord.Exception.Message
    $errorDetails = [string] $ErrorRecord.ErrorDetails.Message
    $combinedText = "$message`n$errorDetails"

    $permissionPatterns = @(
        "StatusCode='401'",
        "StatusCode='403'",
        "Authorization_RequestDenied",
        "AuthenticationFailed",
        "AuthorizationFailed",
        "AccessDenied",
        "Forbidden",
        "Unauthorized",
        "Insufficient privileges",
        "InsufficientPrivileges"
    )

    foreach ($pattern in $permissionPatterns) {
        if ($combinedText.IndexOf($pattern, [System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
            return $true
        }
    }

    return $false
}

function Invoke-GraphRequest {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('GET', 'DELETE')]
        [string] $Method,

        [Parameter(Mandatory = $true)]
        [string] $PathOrUri,

        [hashtable] $Query = @{},

        [switch] $IgnoreNotFound
    )

    $accessToken = Get-GraphAccessToken

    if ($PathOrUri -match '^https?://') {
        $uri = $PathOrUri
    }
    else {
        $path = $PathOrUri

        if (-not $path.StartsWith('/')) {
            $path = "/$path"
        }

        $queryString = ConvertTo-QueryString -Query $Query
        $uri = "$script:GraphBaseUri$path"

        if (-not [string]::IsNullOrWhiteSpace($queryString)) {
            $uri = "$uri`?$queryString"
        }
    }

    $headers = @{
        'Authorization' = "Bearer $accessToken"
        'Accept'        = 'application/json'
    }

    $maxAttempts = [Math]::Max(1, [int] $script:GraphRetryMaxAttempts)

    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        Write-LogInfo "Graph request starting. Method='$Method', Attempt='$attempt', MaxAttempts='$maxAttempts', Uri='$uri'"

        try {
            if ($Method -eq 'GET') {
                $result = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -TimeoutSec $script:GraphTimeoutSeconds
                Write-LogInfo "Graph GET completed successfully. Uri='$uri'"
                return $result
            }

            if ($Method -eq 'DELETE') {
                Invoke-RestMethod -Method Delete -Uri $uri -Headers $headers -TimeoutSec $script:GraphTimeoutSeconds | Out-Null
                Write-LogInfo "Graph DELETE completed successfully. Uri='$uri'"
                return $null
            }
        }
        catch {
            $details = Get-GraphErrorDetails -ErrorRecord $_ -Method $Method -Uri $uri

            if ($IgnoreNotFound -and $details.StatusCode -eq 404) {
                Write-LogWarning "Graph returned 404 for DELETE. Treating as already removed. Uri='$uri'"
                return $null
            }

            if ((Test-IsTransientStatusCode -StatusCode $details.StatusCode) -and $attempt -lt $maxAttempts) {
                $delaySeconds = [Math]::Min(30, [Math]::Pow(2, ($attempt - 1)))
                Write-LogWarning "Transient Graph error. Attempt='$attempt', MaxAttempts='$maxAttempts', DelaySeconds='$delaySeconds', StatusCode='$($details.StatusCode)', GraphMessage='$($details.GraphMessage)'"
                Start-Sleep -Seconds $delaySeconds
                continue
            }

            throw (Format-GraphErrorMessage -Details $details)
        }
    }
}

function Invoke-GraphGetPaged {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path,

        [Parameter(Mandatory = $true)]
        [hashtable] $Query
    )

    $items = @()
    $response = Invoke-GraphRequest -Method GET -PathOrUri $Path -Query $Query

    $pageNumber = 1

    while ($null -ne $response) {
        $propertyNames = @($response.PSObject.Properties.Name)

        if ($propertyNames -contains 'value') {
            $pageItems = @($response.value)
            Write-LogInfo "Graph page received. Page='$pageNumber', Items='$($pageItems.Count)'"
            $items += $pageItems
        }
        else {
            Write-LogInfo "Graph page received. Page='$pageNumber', Items='1'"
            $items += $response
        }

        $nextLink = Get-PropertyValue -Object $response -Names @('@odata.nextLink')

        if ([string]::IsNullOrWhiteSpace([string] $nextLink)) {
            break
        }

        $pageNumber++
        $response = Invoke-GraphRequest -Method GET -PathOrUri ([string] $nextLink)
    }

    Write-LogInfo "Graph paging completed. TotalItems='$($items.Count)'"
    return @($items)
}

function Get-EventId {
    param($Event)

    $eventId = Get-PropertyValue -Object $Event -Names @('id', 'eventId')

    if ([string]::IsNullOrWhiteSpace([string] $eventId)) {
        return 'unknown'
    }

    return [string] $eventId
}

function Get-EventType {
    param($Event)

    $eventType = Get-PropertyValue -Object $Event -Names @('eventType', 'type')

    if ([string]::IsNullOrWhiteSpace([string] $eventType)) {
        return 'unknown'
    }

    return [string] $eventType
}

function Get-EventSubject {
    param($Event)

    $candidates = @(
        (Get-PropertyValue -Object $Event -Names @('subject')),
        (Get-PropertyValue -Object $Event.data -Names @('resourceUri', 'resourceId', 'id')),
        (Get-PropertyValue -Object $Event.data.resourceInfo -Names @('resourceUri', 'resourceId', 'id'))
    )

    foreach ($candidate in $candidates) {
        if (-not [string]::IsNullOrWhiteSpace([string] $candidate)) {
            return [string] $candidate
        }
    }

    return $null
}

function Test-IsDeletedResourceEvent {
    param(
        [Parameter(Mandatory = $true)]
        [string] $EventType
    )

    $allowedTypes = @(
        'Microsoft.ResourceNotifications.Resources.Deleted',
        'Microsoft.Resources.ResourceDeleteSuccess'
    )

    foreach ($allowedType in $allowedTypes) {
        if ($EventType.Equals($allowedType, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

function Find-EntraDevicesByVmName {
    param(
        [Parameter(Mandatory = $true)]
        [string] $VmName
    )

    Write-LogInfo "Starting Entra device lookup. VmName='$VmName'"

    $rawMatches = @()
    $candidateNames = @(Get-NameCandidates -Name $VmName)
    Write-LogInfo "Generated Entra displayName search candidates. Count='$($candidateNames.Count)', Candidates='$($candidateNames -join ',')'"

    foreach ($candidateName in $candidateNames) {
        $escapedName = Escape-ODataString -Value $candidateName
        $filter = "displayName eq '$escapedName'"

        Write-LogInfo "Searching Entra devices by displayName='$candidateName'."

        $query = @{
            '$select' = 'id,deviceId,displayName,accountEnabled,operatingSystem,trustType'
            '$filter' = $filter
            '$top'    = '25'
        }

        $rawMatches += Invoke-GraphGetPaged -Path '/devices' -Query $query
    }

    $matches = @(
        $rawMatches |
            Where-Object {
                -not [string]::IsNullOrWhiteSpace([string] $_.displayName) -and
                ([string] $_.displayName).Equals($VmName, [System.StringComparison]::OrdinalIgnoreCase)
            }
    )

    $uniqueMatches = @(Add-UniqueObjectById -Items $matches -IdProperty 'id')
    Write-LogInfo "Completed Entra device lookup. VmName='$VmName', RawMatches='$($rawMatches.Count)', ExactUniqueMatches='$($uniqueMatches.Count)'"

    return $uniqueMatches
}

function Remove-EntraDevices {
    param(
        [AllowEmptyCollection()]
        [object[]] $Devices = @(),

        [Parameter(Mandatory = $true)]
        [string] $VmName
    )

    $deviceArray = @($Devices)

    if ($deviceArray.Count -eq 0) {
        Write-LogInfo "DEVICE NOT FOUND IN ENTRA: VmName='$VmName'"
        return
    }

    if ($deviceArray.Count -gt $script:MaxMatchesToDelete) {
        throw "Safety stop. Entra device matches '$($deviceArray.Count)' exceed MAX_MATCHES_TO_DELETE '$script:MaxMatchesToDelete' for VmName='$VmName'."
    }

    Write-LogInfo "Preparing Entra delete action. VmName='$VmName', MatchedDevices='$($deviceArray.Count)', DryRun='$script:DryRun'"

    foreach ($device in $deviceArray) {
        Write-LogInfo "Entra match: objectId='$($device.id)', deviceId='$($device.deviceId)', displayName='$($device.displayName)', accountEnabled='$($device.accountEnabled)', trustType='$($device.trustType)'"

        if ($script:DryRun) {
            Write-LogInfo "DRY RUN: Would delete Entra device. objectId='$($device.id)', deviceId='$($device.deviceId)', displayName='$($device.displayName)'"
            continue
        }

        $deviceObjectId = [Uri]::EscapeDataString([string] $device.id)

        Invoke-GraphRequest -Method DELETE -PathOrUri "/devices/$deviceObjectId" -IgnoreNotFound

        Write-LogInfo "Deleted Entra device. objectId='$($device.id)', deviceId='$($device.deviceId)', displayName='$($device.displayName)'"
    }
}

function Process-DeletedVmEvent {
    param(
        [Parameter(Mandatory = $true)]
        $Event
    )

    $eventId = Get-EventId -Event $Event
    $eventType = Get-EventType -Event $Event
    $subject = Get-EventSubject -Event $Event

    Write-LogInfo '------------------------------'
    Write-LogInfo "Processing event. EventId='$eventId', EventType='$eventType', Subject='$subject'"

    if (-not (Test-IsDeletedResourceEvent -EventType $eventType)) {
        Write-LogInfo "Skipped event because it is not a supported delete event. EventType='$eventType', EventId='$eventId'"
        return
    }

    if ([string]::IsNullOrWhiteSpace($subject)) {
        Write-LogWarning "Skipped event because no deleted resource id was found in the payload. EventId='$eventId', EventType='$eventType'"
        return
    }

    $vmInfo = Parse-AzureVmResourceId -ResourceId $subject

    if ($null -eq $vmInfo) {
        Write-LogInfo "Skipped event because deleted resource is not Microsoft.Compute/virtualMachines. Subject='$subject', EventId='$eventId'"
        return
    }

    Write-LogInfo "Deleted VM parsed. SubscriptionId='$($vmInfo.SubscriptionId)', ResourceGroup='$($vmInfo.ResourceGroup)', VmName='$($vmInfo.VmName)'"

    if (-not $vmInfo.SubscriptionId.Equals($script:TargetSubscriptionId, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-LogWarning "Skipped VM because subscription does not match AZURE_SUBSCRIPTION_ID. EventSubscriptionId='$($vmInfo.SubscriptionId)', TargetSubscriptionId='$script:TargetSubscriptionId', VmName='$($vmInfo.VmName)'"
        return
    }

    if (-not $script:DeleteEntraDevice) {
        Write-LogWarning "DELETE_ENTRA_DEVICE=false. Skipping Entra deletion for VmName='$($vmInfo.VmName)'."
        return
    }

    Write-LogInfo "VM passed validation. Starting Entra deletion workflow. VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)'"

    try {
        Write-LogInfo 'Connecting to Microsoft Graph using managed identity.'
        [void] (Get-GraphAccessToken)
        Write-LogInfo 'Connected to Microsoft Graph.'

        $entraDevices = @(Find-EntraDevicesByVmName -VmName $vmInfo.VmName)
        Write-LogInfo "Entra device matches found: '$($entraDevices.Count)' for VmName='$($vmInfo.VmName)'."

        Remove-EntraDevices -Devices $entraDevices -VmName $vmInfo.VmName
    }
    catch {
        if (Test-IsGraphPermissionOrAuthError -ErrorRecord $_) {
            Write-LogWarning "Microsoft Graph permission/authentication is not available. Skipping Entra device deletion and marking this event as successful. VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)', Error='$($_.Exception.Message)'"
            Write-LogInfo "Function completed successfully with Graph permission warning for VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)'."
            return
        }

        throw
    }

    Write-LogInfo "Function completed successfully for VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)', DryRun='$script:DryRun'."
}

try {
    Initialize-Settings

    $messageId = Get-PropertyValue -Object $TriggerMetadata -Names @('MessageId', 'messageId')
    $deliveryCount = Get-PropertyValue -Object $TriggerMetadata -Names @('DeliveryCount', 'deliveryCount')

    Write-LogInfo '=============================='
    Write-LogInfo "vm-entra-delete function started. MessageId='$messageId', DeliveryCount='$deliveryCount'"

    $messageText = ConvertTo-MessageText -InputObject $Message
    Write-LogInfo "Service Bus message body converted to text. Length='$($messageText.Length)'"

    $events = ConvertFrom-MessageText -MessageText $messageText
    Write-LogInfo "Service Bus message parsed. EventCount='$($events.Count)'"

    $eventIndex = 0
    foreach ($event in $events) {
        $eventIndex++
        Write-LogInfo "Starting event '$eventIndex' of '$($events.Count)'."
        Process-DeletedVmEvent -Event $event
        Write-LogInfo "Completed event '$eventIndex' of '$($events.Count)'."
    }

    Write-LogInfo "vm-entra-delete function completed. MessageId='$messageId'"
}
catch {
    $exceptionMessage = $_.Exception.Message
    Write-LogError "EXCEPTION: $exceptionMessage"
    Write-Error "EXCEPTION: $exceptionMessage"
    throw
}
