#  This module creates Subnets in Azure which can be used to segment and organize network resources within a Virtual Network.  
resource "azurerm_subnet" "snet" {
  for_each = var.snetVariables
  name                 = each.value.snetName
  resource_group_name  = each.value.vnetrg
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.snetAddressPrefix
  service_endpoints                             = try(each.value.service_endpoints, [])
  service_endpoint_policy_ids                   = try(each.value.service_endpoint_policy_ids, [])
  private_endpoint_network_policies             = try(each.value.private_endpoint_network_policies, "Disabled")
  private_link_service_network_policies_enabled = try(each.value.private_link_service_network_policies_enabled, true)

  dynamic "delegation" {
    for_each = try(each.value.delegations, []) 
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes = [service_endpoints]
  }
}