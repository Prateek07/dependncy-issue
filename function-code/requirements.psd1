@{
    # Required for Connect-AzAccount, managed identity, and Azure context handling
    'Az.Accounts' = '5.*'

    # Required for Azure resource tag read/update operations
    'Az.Resources' = '9.*'

    # Required to read VM, NIC, OS disk, and data disk details
    'Az.Compute' = '11.*'

    # Required to read AVD host pools/session hosts and update assigned user
    'Az.DesktopVirtualization' = '5.*'
}
