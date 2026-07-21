variable "storageAccountVariables" {
  description = "Map of Storage Accounts. Used here for the Windows Function App backing storage."
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_kind                      = optional(string, "StorageV2")
    account_tier                      = optional(string, "Standard")
    account_replication_type          = optional(string, "LRS")
    access_tier                       = optional(string, "Hot")
    min_tls_version                   = optional(string, "TLS1_2")
    https_traffic_only_enabled        = optional(bool, true)
    allow_nested_items_to_be_public   = optional(bool, false)
    shared_access_key_enabled         = optional(bool, true)
    public_network_access_enabled     = optional(bool, true)
    cross_tenant_replication_enabled  = optional(bool, false)
    default_to_oauth_authentication   = optional(bool, false)
    is_hns_enabled                    = optional(bool, false)
    nfsv3_enabled                     = optional(bool, false)
    sftp_enabled                      = optional(bool, false)
    large_file_share_enabled          = optional(bool, false)
    local_user_enabled                = optional(bool, true)
    queue_encryption_key_type         = optional(string, "Service")
    table_encryption_key_type         = optional(string, "Service")
    infrastructure_encryption_enabled = optional(bool, false)
    dns_endpoint_type                 = optional(string, "Standard")
    allowed_copy_scope                = optional(string)
    tags                              = optional(map(string), {})
  }))
  default = {}
}
 
variable "storageContainerVariables" {
  description = "Map of Blob containers to create inside the Storage Accounts. Use storage_account_key to point to storageAccountVariables."
  type = map(object({
    name                              = string
    storage_account_key               = string
    container_access_type             = optional(string, "private")
    default_encryption_scope          = optional(string)
    encryption_scope_override_enabled = optional(bool, true)
    metadata                          = optional(map(string), {})
  }))
  default = {}
}
 