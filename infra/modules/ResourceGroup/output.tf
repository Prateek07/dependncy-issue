output "rg" {
  description = "Map of created/managed Resource Groups"
  value       = azurerm_resource_group.rg
}
output "rg_names" {

  description = "Resource group names by key"

  value = {

    for key, rg in azurerm_resource_group.rg : key => rg.name

  }

}
 
output "rg_locations" {

  description = "Resource group locations by key"

  value = {

    for key, rg in azurerm_resource_group.rg : key => rg.location

  }

}
 
output "rg_ids" {

  description = "Resource group IDs by key"

  value = {

    for key, rg in azurerm_resource_group.rg : key => rg.id

  }

}
 