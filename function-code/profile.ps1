# profile.ps1
# Runs once when the Azure Functions PowerShell worker starts.

$ErrorActionPreference = "Stop"

Write-Host "[PROFILE] PowerShell worker profile initialization started."

try {
    Disable-AzContextAutosave -Scope Process | Out-Null

    $managedIdentityClientId = $env:MANAGED_IDENTITY_CLIENT_ID
    $subscriptionId         = $env:AZURE_SUBSCRIPTION_ID

    if ([string]::IsNullOrWhiteSpace($managedIdentityClientId)) {
        throw "MANAGED_IDENTITY_CLIENT_ID app setting is missing. Provide the Client ID of the user-assigned managed identity."
    }

    Write-Host "[PROFILE] Connecting to AzureUSGovernment with user-assigned managed identity."
    Write-Host "[PROFILE] Managed identity Client ID: $managedIdentityClientId"

    $maxAttempts = 3
    $connected   = $false

    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        try {
            Connect-AzAccount `
                -Identity `
                -AccountId $managedIdentityClientId `
                -Environment AzureUSGovernment `
                -ErrorAction Stop | Out-Null

            $connected = $true
            Write-Host "[PROFILE] Managed identity authentication succeeded on attempt $attempt."
            break
        }
        catch {
            Write-Warning "[PROFILE] Managed identity authentication attempt $attempt of $maxAttempts failed. Error='$($_.Exception.Message)'."

            if ($attempt -lt $maxAttempts) {
                Start-Sleep -Seconds 5
            }
        }
    }

    if (-not $connected) {
        throw "Managed identity authentication failed after $maxAttempts attempts."
    }

    if (-not [string]::IsNullOrWhiteSpace($subscriptionId)) {
        Set-AzContext `
            -SubscriptionId $subscriptionId `
            -ErrorAction Stop | Out-Null

        Write-Host "[PROFILE] Azure context set to subscription '$subscriptionId'."
    }
    else {
        Write-Warning "[PROFILE] AZURE_SUBSCRIPTION_ID is not configured. The default accessible subscription context will be used."
    }

    $context = Get-AzContext

    if ($null -eq $context) {
        throw "Azure context was not available after managed identity authentication."
    }

    Write-Host "[PROFILE] Connected account: $($context.Account.Id)"
    Write-Host "[PROFILE] Environment: $($context.Environment.Name)"
    Write-Host "[PROFILE] Subscription: $($context.Subscription.Id)"
    Write-Host "[PROFILE] PowerShell worker profile initialization completed successfully."
}
catch {
    Write-Error "[PROFILE] Initialization failed. Error='$($_.Exception.Message)'."
    throw
}
