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

    $timestampUtc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ssZ')
    Write-Host "[INFO] [$timestampUtc] $Message"
    Write-Information $Message -InformationAction Continue
}

function Write-LogWarning {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Message
    )

    $timestampUtc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ssZ')
    Write-Host "[WARNING] [$timestampUtc] $Message"
    Write-Warning $Message
}

function Write-LogError {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Message
    )

    $timestampUtc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ssZ')
    Write-Host "[ERROR] [$timestampUtc] $Message"
    Write-Error $Message
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

function Get-CsvAppSetting {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name
    )

    $raw = Get-AppSetting -Name $Name -DefaultValue $null

    if ([string]::IsNullOrWhiteSpace($raw)) {
        return @()
    }

    return @(
        $raw -split ',' |
            ForEach-Object { $_.Trim() } |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )
}

function Get-NormalizedAutomationRegion {
    $region = Get-AppSetting -Name 'AUTOMATION_REGION' -Required

    switch ($region.Trim().ToLowerInvariant()) {
        'arizona'       { return 'usgovarizona' }
        'usgovarizona'  { return 'usgovarizona' }
        'virginia'      { return 'usgovvirginia' }
        'usgovvirginia' { return 'usgovvirginia' }
        default {
            throw "Invalid AUTOMATION_REGION '$region'. Allowed values are usgovarizona or usgovvirginia."
        }
    }
}

function Get-EventResourceLocation {
    param([Parameter(Mandatory)]$Event)

    $resourceInfo = Get-PropertyValue -Object (Get-PropertyValue -Object $Event -Names @('data')) -Names @('resourceInfo')
    $eventData = Get-PropertyValue -Object $Event -Names @('data')
    $candidates = @(
        (Get-PropertyValue -Object $resourceInfo -Names @('location', 'resourceLocation')),
        (Get-PropertyValue -Object $eventData -Names @('location', 'resourceLocation'))
    )

    foreach ($candidate in $candidates) {
        if (-not [string]::IsNullOrWhiteSpace([string]$candidate)) {
            return ([string]$candidate).Trim().ToLowerInvariant()
        }
    }
    return ''
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
        throw "Service Bus message body is empty."
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
        ResourceGroup = $Matches[2]
        VmName        = [Uri]::UnescapeDataString($Matches[3])
        ResourceId    = $cleanResourceId
    }
}

function Test-StringInListIgnoreCase {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Value,

        [AllowEmptyCollection()]
        [string[]] $List = @()
    )

    foreach ($item in $List) {
        if ($Value.Equals($item, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

function Test-StartsWithAnyIgnoreCase {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Value,

        [AllowEmptyCollection()]
        [string[]] $Prefixes = @()
    )

    foreach ($prefix in $Prefixes) {
        if ($Value.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

function Get-NameCandidates {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name
    )

    $ordered = [ordered]@{}

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

function Initialize-Settings {
    Write-LogInfo "Initializing avd-vmlifecycle-delete settings."

    $script:TargetSubscriptionId = (Get-AppSetting -Name 'AZURE_SUBSCRIPTION_ID' -Required).ToLowerInvariant()
    $script:ManagedIdentityClientId = Get-AppSetting -Name 'MANAGED_IDENTITY_CLIENT_ID' -DefaultValue $null
    $script:AutomationRegion = Get-NormalizedAutomationRegion

    $script:DryRun = Get-BoolAppSetting -Name 'DRY_RUN' -DefaultValue $true
    $script:DeleteEntraDevice = Get-BoolAppSetting -Name 'DELETE_ENTRA_DEVICE' -DefaultValue $true
    $script:DeleteIntuneDevice = Get-BoolAppSetting -Name 'DELETE_INTUNE_DEVICE' -DefaultValue $true
    $script:SkipIntuneWhenNotApplicable = Get-BoolAppSetting -Name 'SKIP_INTUNE_WHEN_NOT_APPLICABLE' -DefaultValue $true
    $script:MaxMatchesToDelete = Get-IntAppSetting -Name 'MAX_MATCHES_TO_DELETE' -DefaultValue 1

    if ($script:MaxMatchesToDelete -lt 1) {
        throw "MAX_MATCHES_TO_DELETE must be 1 or greater."
    }

    $script:AllowAllVmNamesInSubscription = Get-BoolAppSetting -Name 'ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION' -DefaultValue $false

    if (-not $script:AllowAllVmNamesInSubscription) {
        throw "Safety guard missing. Set ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION=true to allow avd-vmlifecycle-delete to process VM delete events in the configured subscription."
    }

    $graphRootDefault = Get-AppSetting -Name 'GRAPH_ROOT' -DefaultValue 'https://graph.microsoft.us/v1.0'
    $script:GraphBaseUri = (Get-AppSetting -Name 'GRAPH_BASE_URI' -DefaultValue $graphRootDefault).TrimEnd('/')

    $graphResourceDefault = Get-AppSetting -Name 'GRAPH_RESOURCE' -DefaultValue 'https://graph.microsoft.us'
    $script:GraphResource = $graphResourceDefault.TrimEnd('/') + '/'

    $script:GraphTimeoutSeconds = Get-IntAppSetting -Name 'GRAPH_REQUEST_TIMEOUT_SECONDS' -DefaultValue 60
    $script:GraphRetryMaxAttempts = Get-IntAppSetting -Name 'GRAPH_RETRY_MAX_ATTEMPTS' -DefaultValue 3

    if ($script:GraphRetryMaxAttempts -lt 1) {
        $script:GraphRetryMaxAttempts = 1
    }

    $script:IntuneApiNotApplicable = $false

    Write-LogInfo "Using AZURE_SUBSCRIPTION_ID='$script:TargetSubscriptionId'."
    Write-LogInfo "Regional scope: AUTOMATION_REGION='$script:AutomationRegion'."
    Write-LogInfo "Using Microsoft Graph endpoint='$script:GraphBaseUri' and resource='$script:GraphResource'."
    Write-LogInfo "GCC High/Azure Government expected endpoint is https://graph.microsoft.us."
    Write-LogInfo "Safety settings: DRY_RUN='$script:DryRun', DELETE_ENTRA_DEVICE='$script:DeleteEntraDevice', DELETE_INTUNE_DEVICE='$script:DeleteIntuneDevice', SKIP_INTUNE_WHEN_NOT_APPLICABLE='$script:SkipIntuneWhenNotApplicable', MAX_MATCHES_TO_DELETE='$script:MaxMatchesToDelete', ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION='$script:AllowAllVmNamesInSubscription'."
    Write-LogInfo "VM scope: all VM delete events in AZURE_SUBSCRIPTION_ID are allowed."

    if (-not [string]::IsNullOrWhiteSpace($script:ManagedIdentityClientId)) {
        Write-LogInfo "Using user-assigned managed identity client id from MANAGED_IDENTITY_CLIENT_ID."
    }
    else {
        Write-LogInfo "MANAGED_IDENTITY_CLIENT_ID not configured. Using system-assigned managed identity."
    }
}

function Get-GraphAccessToken {
    $nowUtc = (Get-Date).ToUniversalTime()

    if (
        -not [string]::IsNullOrWhiteSpace($script:GraphAccessToken) -and
        $null -ne $script:GraphAccessTokenExpiresOnUtc -and
        $script:GraphAccessTokenExpiresOnUtc -gt $nowUtc.AddMinutes(5)
    ) {
        return $script:GraphAccessToken
    }

    $resource = $script:GraphResource

    if (-not [string]::IsNullOrWhiteSpace($env:IDENTITY_ENDPOINT) -and -not [string]::IsNullOrWhiteSpace($env:IDENTITY_HEADER)) {
        $query = @{
            'api-version' = '2019-08-01'
            'resource'    = $resource
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
            'resource' = $resource
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
        throw "Managed identity endpoint environment variables were not found. Confirm managed identity is enabled on the Function App."
    }

    if ([string]::IsNullOrWhiteSpace($tokenResponse.access_token)) {
        throw "Managed identity token response did not contain access_token."
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

    return [pscustomobject]@{
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
    param(
        $StatusCode
    )

    if ($null -eq $StatusCode) {
        return $false
    }

    [int] $code = [int] $StatusCode

    if ($code -eq 408 -or $code -eq 429 -or $code -ge 500) {
        return $true
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

        [hashtable] $ExtraHeaders = @{},

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

    foreach ($key in $ExtraHeaders.Keys) {
        $headers[$key] = $ExtraHeaders[$key]
    }

    $maxAttempts = [Math]::Max(1, [int] $script:GraphRetryMaxAttempts)

    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        try {
            if ($Method -eq 'GET') {
                return Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -TimeoutSec $script:GraphTimeoutSeconds
            }

            if ($Method -eq 'DELETE') {
                Invoke-RestMethod -Method Delete -Uri $uri -Headers $headers -TimeoutSec $script:GraphTimeoutSeconds | Out-Null
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

    while ($null -ne $response) {
        $propertyNames = @($response.PSObject.Properties.Name)

        if ($propertyNames -contains 'value') {
            $items += @($response.value)
        }
        else {
            $items += $response
        }

        $nextLink = Get-PropertyValue -Object $response -Names @('@odata.nextLink')

        if ([string]::IsNullOrWhiteSpace($nextLink)) {
            break
        }

        $response = Invoke-GraphRequest -Method GET -PathOrUri $nextLink
    }

    return @($items)
}

function Test-IsIntuneNotApplicableError {
    param(
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.ErrorRecord] $ErrorRecord
    )

    $text = @(
        [string] $ErrorRecord.Exception.Message,
        [string] $ErrorRecord.ErrorDetails.Message,
        [string] $ErrorRecord.ToString()
    ) -join ' '

    if ($text -match 'Request not applicable to target tenant') {
        return $true
    }

    return $false
}

function Set-IntuneNotApplicableAndLog {
    param(
        [Parameter(Mandatory = $true)]
        [string] $VmName
    )

    $script:IntuneApiNotApplicable = $true

    Write-LogWarning "INTUNE NOT APPLICABLE TO TARGET TENANT: Microsoft Graph returned 'Request not applicable to target tenant' while processing VmName='$VmName'. Intune lookup/delete will be skipped and the Service Bus message will be completed. If this tenant should use Intune, verify the Function App managed identity is in the same tenant that has Intune enabled and has the required Microsoft Graph application permissions. If this tenant does not use Intune, set DELETE_INTUNE_DEVICE=false."
}

function Test-VmAllowedByScope {
    param(
        [Parameter(Mandatory = $true)]
        [string] $VmName,

        [Parameter(Mandatory = $true)]
        [string] $ResourceGroup
    )

    if ($script:AllowAllVmNamesInSubscription) {
        return $true
    }

    Write-LogWarning "Skipped VM because ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION is not true. ResourceGroup='$ResourceGroup', VmName='$VmName'"
    return $false
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

    $rawMatches = @()

    foreach ($candidateName in (Get-NameCandidates -Name $VmName)) {
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

    return Add-UniqueObjectById -Items $matches -IdProperty 'id'
}

function Find-IntuneManagedDevicesByVmName {
    param(
        [Parameter(Mandatory = $true)]
        [string] $VmName,

        [AllowEmptyCollection()]
        [string[]] $AzureAdDeviceIds = @()
    )

    if ($script:IntuneApiNotApplicable) {
        Write-LogWarning "Skipping Intune lookup because Intune was already marked not applicable for this invocation. VmName='$VmName'"
        return @()
    }

    $rawMatches = @()

    try {
        foreach ($candidateName in (Get-NameCandidates -Name $VmName)) {
            $escapedName = Escape-ODataString -Value $candidateName
            $filter = "deviceName eq '$escapedName'"

            Write-LogInfo "Searching Intune managed devices by deviceName='$candidateName'."

            $query = @{
                '$select' = 'id,deviceName,azureADDeviceId,operatingSystem,complianceState,lastSyncDateTime,userPrincipalName'
                '$filter' = $filter
                '$top'    = '25'
            }

            $rawMatches += Invoke-GraphGetPaged -Path '/deviceManagement/managedDevices' -Query $query
        }

        foreach ($azureAdDeviceId in @($AzureAdDeviceIds)) {
            if ([string]::IsNullOrWhiteSpace($azureAdDeviceId)) {
                continue
            }

            $escapedAzureAdDeviceId = Escape-ODataString -Value $azureAdDeviceId
            $filter = "azureADDeviceId eq '$escapedAzureAdDeviceId'"

            Write-LogInfo "Searching Intune managed devices by azureADDeviceId='$azureAdDeviceId'."

            $query = @{
                '$select' = 'id,deviceName,azureADDeviceId,operatingSystem,complianceState,lastSyncDateTime,userPrincipalName'
                '$filter' = $filter
                '$top'    = '25'
            }

            $rawMatches += Invoke-GraphGetPaged -Path '/deviceManagement/managedDevices' -Query $query
        }
    }
    catch {
        if ((Test-IsIntuneNotApplicableError -ErrorRecord $_) -and $script:SkipIntuneWhenNotApplicable) {
            Set-IntuneNotApplicableAndLog -VmName $VmName
            return @()
        }

        throw
    }

    $matches = @(
        $rawMatches |
            Where-Object {
                $nameMatches = (
                    -not [string]::IsNullOrWhiteSpace([string] $_.deviceName) -and
                    ([string] $_.deviceName).Equals($VmName, [System.StringComparison]::OrdinalIgnoreCase)
                )

                $idMatches = $false

                foreach ($azureAdDeviceId in @($AzureAdDeviceIds)) {
                    if (
                        -not [string]::IsNullOrWhiteSpace($azureAdDeviceId) -and
                        -not [string]::IsNullOrWhiteSpace([string] $_.azureADDeviceId) -and
                        ([string] $_.azureADDeviceId).Equals($azureAdDeviceId, [System.StringComparison]::OrdinalIgnoreCase)
                    ) {
                        $idMatches = $true
                        break
                    }
                }

                $nameMatches -or $idMatches
            }
    )

    return Add-UniqueObjectById -Items $matches -IdProperty 'id'
}

function Remove-IntuneManagedDevices {
    param(
        [AllowEmptyCollection()]
        [object[]] $Devices = @(),

        [Parameter(Mandatory = $true)]
        [string] $VmName
    )

    if ($script:IntuneApiNotApplicable) {
        Write-LogWarning "INTUNE DELETE SKIPPED: Intune Graph API is not applicable to the target tenant. VmName='$VmName'"
        return
    }

    $deviceArray = @($Devices)

    if ($deviceArray.Count -eq 0) {
        Write-LogInfo "DEVICE NOT FOUND IN INTUNE: VmName='$VmName'"
        return
    }

    if ($deviceArray.Count -gt $script:MaxMatchesToDelete) {
        throw "Safety stop. Intune matches '$($deviceArray.Count)' exceed MAX_MATCHES_TO_DELETE '$script:MaxMatchesToDelete' for VmName='$VmName'."
    }

    foreach ($device in $deviceArray) {
        Write-LogInfo "Intune match: managedDeviceId='$($device.id)', deviceName='$($device.deviceName)', azureADDeviceId='$($device.azureADDeviceId)', complianceState='$($device.complianceState)'"

        if ($script:DryRun) {
            Write-LogInfo "DRY RUN: Would delete Intune managed device. managedDeviceId='$($device.id)', deviceName='$($device.deviceName)'"
            continue
        }

        $managedDeviceId = [Uri]::EscapeDataString([string] $device.id)

        try {
            Invoke-GraphRequest -Method DELETE -PathOrUri "/deviceManagement/managedDevices/$managedDeviceId" -IgnoreNotFound
        }
        catch {
            if ((Test-IsIntuneNotApplicableError -ErrorRecord $_) -and $script:SkipIntuneWhenNotApplicable) {
                Set-IntuneNotApplicableAndLog -VmName $VmName
                return
            }

            throw
        }

        Write-LogInfo "Deleted Intune managed device. managedDeviceId='$($device.id)', deviceName='$($device.deviceName)'"
    }
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

    $script:CurrentCleanupContext = [ordered]@{
        VmName         = 'Unknown'
        ResourceGroup  = 'Unknown'
        SubscriptionId = 'Unknown'
        EventId        = $eventId
        EventType      = $eventType
        Subject        = $subject
    }

    Write-LogInfo "------------------------------------------------------------"
    Write-LogInfo "Processing Event Grid message. EventId='$eventId', EventType='$eventType', Subject='$subject'"

    if (-not (Test-IsDeletedResourceEvent -EventType $eventType)) {
        Write-LogWarning "Skipped event because it is not a supported VM deleted event. EventType='$eventType'."
        return
    }

    if ([string]::IsNullOrWhiteSpace($subject)) {
        Write-LogWarning "Skipped event because subject/resource ID is empty. EventId='$eventId'."
        return
    }

    $vmInfo = Parse-AzureVmResourceId -ResourceId $subject

    if ($null -eq $vmInfo) {
        Write-LogWarning "Skipped event because subject is not a Microsoft.Compute/virtualMachines resource ID. Subject='$subject'."
        return
    }

    $script:CurrentCleanupContext = [ordered]@{
        VmName         = $vmInfo.VmName
        ResourceGroup  = $vmInfo.ResourceGroup
        SubscriptionId = $vmInfo.SubscriptionId
        EventId        = $eventId
        EventType      = $eventType
        Subject        = $subject
    }

    Write-LogInfo "Deleted VM parsed successfully."
    Write-LogInfo "VMName='$($vmInfo.VmName)'."
    Write-LogInfo "ResourceGroup='$($vmInfo.ResourceGroup)'."
    Write-LogInfo "SubscriptionId='$($vmInfo.SubscriptionId)'."
    Write-LogInfo "ResourceId='$($vmInfo.ResourceId)'."

    $eventResourceLocation = Get-EventResourceLocation -Event $Event
    if ([string]::IsNullOrWhiteSpace($eventResourceLocation)) {
        Write-LogWarning "Skipped VM deletion because the event does not contain resource location. VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)', FunctionRegion='$script:AutomationRegion'."
        return
    }
    if (-not $eventResourceLocation.Equals($script:AutomationRegion, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-LogWarning "Skipped VM deletion because event location '$eventResourceLocation' does not match Function App region '$script:AutomationRegion'. VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)'."
        return
    }
    Write-LogInfo "VM deletion event passed regional validation for '$script:AutomationRegion'."

    if (-not $vmInfo.SubscriptionId.Equals($script:TargetSubscriptionId, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-LogWarning "Skipped VM because subscription does not match AZURE_SUBSCRIPTION_ID. EventSubscriptionId='$($vmInfo.SubscriptionId)', TargetSubscriptionId='$script:TargetSubscriptionId', VmName='$($vmInfo.VmName)'."
        return
    }

    if (-not (Test-VmAllowedByScope -VmName $vmInfo.VmName -ResourceGroup $vmInfo.ResourceGroup)) {
        Write-LogWarning "Skipped VM because ALLOW_ALL_VM_NAMES_IN_SUBSCRIPTION is not true. VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)'."
        return
    }

    if (-not $script:DeleteEntraDevice -and -not $script:DeleteIntuneDevice) {
        Write-LogWarning "Both DELETE_ENTRA_DEVICE and DELETE_INTUNE_DEVICE are false. No Graph cleanup will be performed for VmName='$($vmInfo.VmName)'."
        return
    }

    Write-LogInfo "Connecting to Microsoft Graph with managed identity."
    [void] (Get-GraphAccessToken)
    Write-LogInfo "Microsoft Graph token acquired successfully."

    $entraDevices = @()
    $intuneDevices = @()

    if ($script:DeleteEntraDevice) {
        Write-LogInfo "Starting Entra device lookup for VmName='$($vmInfo.VmName)'."
        $entraDevices = @(Find-EntraDevicesByVmName -VmName $vmInfo.VmName)
        Write-LogInfo "Entra lookup completed. MatchCount='$($entraDevices.Count)'."
    }
    else {
        Write-LogInfo "Skipping Entra lookup because DELETE_ENTRA_DEVICE=false."
    }

    $azureAdDeviceIds = @(
        $entraDevices |
            ForEach-Object { [string] $_.deviceId } |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )

    if ($script:DeleteIntuneDevice) {
        Write-LogInfo "Starting Intune managed device lookup for VmName='$($vmInfo.VmName)'. AzureAdDeviceIdCount='$($azureAdDeviceIds.Count)'."
        $intuneDevices = @(Find-IntuneManagedDevicesByVmName -VmName $vmInfo.VmName -AzureAdDeviceIds $azureAdDeviceIds)
        Write-LogInfo "Intune lookup completed. MatchCount='$($intuneDevices.Count)'."
    }
    else {
        Write-LogInfo "Skipping Intune lookup because DELETE_INTUNE_DEVICE=false."
    }

    $entraMatchCount = @($entraDevices).Count
    $intuneMatchCount = @($intuneDevices).Count

    Write-LogInfo "Cleanup match summary. VmName='$($vmInfo.VmName)', EntraMatches='$entraMatchCount', IntuneMatches='$intuneMatchCount', MaxMatchesToDelete='$script:MaxMatchesToDelete'."

    if ($entraMatchCount -gt $script:MaxMatchesToDelete -or $intuneMatchCount -gt $script:MaxMatchesToDelete) {
        Write-LogWarning "Safety stop. Matching device count exceeds MAX_MATCHES_TO_DELETE. VmName='$($vmInfo.VmName)', EntraMatches='$entraMatchCount', IntuneMatches='$intuneMatchCount', MAX_MATCHES_TO_DELETE='$script:MaxMatchesToDelete'. Deletion skipped and Service Bus message will be completed."
        return
    }

    if ($script:DeleteIntuneDevice) {
        Write-LogInfo "Starting Intune cleanup for VmName='$($vmInfo.VmName)'."
        Remove-IntuneManagedDevices -Devices $intuneDevices -VmName $vmInfo.VmName
        Write-LogInfo "Intune cleanup step completed for VmName='$($vmInfo.VmName)'."
    }

    if ($script:DeleteEntraDevice) {
        Write-LogInfo "Starting Entra cleanup for VmName='$($vmInfo.VmName)'."
        Remove-EntraDevices -Devices $entraDevices -VmName $vmInfo.VmName
        Write-LogInfo "Entra cleanup step completed for VmName='$($vmInfo.VmName)'."
    }

    $entraOutcome = if (-not $script:DeleteEntraDevice) {
        'Skipped because DELETE_ENTRA_DEVICE=false'
    }
    elseif ($entraMatchCount -eq 0) {
        'No matching Entra device found'
    }
    elseif ($script:DryRun) {
        "Dry run only. Would delete $entraMatchCount matching Entra device(s)"
    }
    else {
        "Deleted $entraMatchCount matching Entra device(s)"
    }

    $intuneOutcome = if (-not $script:DeleteIntuneDevice) {
        'Skipped because DELETE_INTUNE_DEVICE=false'
    }
    elseif ($script:IntuneApiNotApplicable) {
        'Skipped because Intune Graph API is not applicable to this tenant'
    }
    elseif ($intuneMatchCount -eq 0) {
        'No matching Intune managed device found'
    }
    elseif ($script:DryRun) {
        "Dry run only. Would delete $intuneMatchCount matching Intune managed device(s)"
    }
    else {
        "Deleted $intuneMatchCount matching Intune managed device(s)"
    }

    Write-LogInfo "Cleanup outcome. VmName='$($vmInfo.VmName)', EntraOutcome='$entraOutcome', IntuneOutcome='$intuneOutcome', DryRun='$script:DryRun'."
    Write-LogInfo "Function event processing completed successfully for VmName='$($vmInfo.VmName)', ResourceGroup='$($vmInfo.ResourceGroup)'."
}

try {
    Initialize-Settings

    $messageId = Get-PropertyValue -Object $TriggerMetadata -Names @('MessageId', 'messageId')
    $deliveryCount = Get-PropertyValue -Object $TriggerMetadata -Names @('DeliveryCount', 'deliveryCount')

    $script:CurrentServiceBusMessageId = [string] $messageId
    $script:CurrentServiceBusDeliveryCount = [string] $deliveryCount

    Write-LogInfo "============================================================"
    Write-LogInfo "avd-vmlifecycle-delete Service Bus trigger fired."
    Write-LogInfo "ServiceBusMessageId='$messageId', DeliveryCount='$deliveryCount'."

    $messageText = ConvertTo-MessageText -InputObject $Message
    Write-LogInfo "Service Bus message converted to text. PayloadLength='$($messageText.Length)'."

    $events = ConvertFrom-MessageText -MessageText $messageText
    Write-LogInfo "Event payload parsed successfully. EventCount='$(@($events).Count)'."

    foreach ($event in $events) {
        Process-DeletedVmEvent -Event $event
    }

    Write-LogInfo "avd-vmlifecycle-delete function completed successfully. ServiceBusMessageId='$messageId'."
}
catch {
    $exceptionMessage = $_.Exception.Message
    $scriptName = if ($_.InvocationInfo.ScriptName) { $_.InvocationInfo.ScriptName } else { 'unknown' }
    $scriptLineNumber = if ($_.InvocationInfo.ScriptLineNumber) { $_.InvocationInfo.ScriptLineNumber } else { 'unknown' }
    $lineText = if ($_.InvocationInfo.Line) { $_.InvocationInfo.Line.Trim() } else { 'unknown' }

    $ctx = $script:CurrentCleanupContext

    if ($null -ne $ctx) {
        Write-LogWarning "Failure context. VmName='$($ctx.VmName)', ResourceGroup='$($ctx.ResourceGroup)', SubscriptionId='$($ctx.SubscriptionId)', EventId='$($ctx.EventId)', EventType='$($ctx.EventType)', Subject='$($ctx.Subject)'."
    }
    else {
        Write-LogWarning "Failure context is not available. The function failed before VM/event details were parsed."
    }

    Write-LogWarning "Error location. ScriptName='$scriptName', LineNumber='$scriptLineNumber', Line='$lineText'."
    Write-LogWarning "Script stack trace: $($_.ScriptStackTrace)"
    Write-LogError "EXCEPTION: $exceptionMessage"

    throw
}
