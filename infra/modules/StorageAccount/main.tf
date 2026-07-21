resource "azurerm_storage_account" "storageAccount" {
  for_each = var.storageAccountVariables
 
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  account_kind                      = try(each.value.account_kind, "StorageV2")
  account_tier                      = try(each.value.account_tier, "Standard")
  account_replication_type          = try(each.value.account_replication_type, "LRS")
  access_tier                       = try(each.value.access_tier, "Hot")
  min_tls_version                   = try(each.value.min_tls_version, "TLS1_2")
  https_traffic_only_enabled        = try(each.value.https_traffic_only_enabled, true)
  allow_nested_items_to_be_public   = try(each.value.allow_nested_items_to_be_public, false)
  shared_access_key_enabled         = try(each.value.shared_access_key_enabled, true)
  public_network_access_enabled     = try(each.value.public_network_access_enabled, true)
  cross_tenant_replication_enabled  = try(each.value.cross_tenant_replication_enabled, false)
  default_to_oauth_authentication   = try(each.value.default_to_oauth_authentication, false)
  is_hns_enabled                    = try(each.value.is_hns_enabled, false)
  nfsv3_enabled                     = try(each.value.nfsv3_enabled, false)
  sftp_enabled                      = try(each.value.sftp_enabled, false)
  large_file_share_enabled          = try(each.value.large_file_share_enabled, false)
  local_user_enabled                = try(each.value.local_user_enabled, true)
  queue_encryption_key_type         = try(each.value.queue_encryption_key_type, "Service")
  table_encryption_key_type         = try(each.value.table_encryption_key_type, "Service")
  infrastructure_encryption_enabled = try(each.value.infrastructure_encryption_enabled, false)
  dns_endpoint_type                 = try(each.value.dns_endpoint_type, "Standard")
  allowed_copy_scope                = try(each.value.allowed_copy_scope, null)
 
  tags = try(each.value.tags, {})
 
  # lifecycle {
  #   prevent_destroy = true
  # }
}
 
resource "azurerm_storage_container" "storageContainer" {
  for_each = var.storageContainerVariables
 
  name                              = each.value.name
  storage_account_id                = azurerm_storage_account.storageAccount[each.value.storage_account_key].id
  container_access_type             = try(each.value.container_access_type, "private")
  default_encryption_scope          = try(each.value.default_encryption_scope, null)
  encryption_scope_override_enabled = try(each.value.default_encryption_scope, null) == null ? null : try(each.value.encryption_scope_override_enabled, true)
  metadata                          = try(each.value.metadata, {})
 
  depends_on = [
    azurerm_storage_account.storageAccount
  ]
}
 
 