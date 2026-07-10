
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create
-/+ destroy and then create replacement
 <= read (data resources)

Terraform will perform the following actions:

  # module.ComputeGalleryImageVersionData.data.azurerm_shared_image_version.image_version["az-avd-img-ver-prod-1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_shared_image_version" "image_version" {
      + exclude_from_latest   = (known after apply)
      + gallery_name          = "ig_avd_osimage_usgovaz_p01"
      + id                    = (known after apply)
      + image_name            = "idf-avd-osimage-w11ss-25h2-usgovaz-p01"
      + location              = (known after apply)
      + managed_image_id      = (known after apply)
      + name                  = "1.0.0"
      + os_disk_image_size_gb = (known after apply)
      + os_disk_snapshot_id   = (known after apply)
      + resource_group_name   = "rg-avd-osimage-usgovaz-p01"
      + target_region         = (known after apply)
    }

  # module.ComputeGalleryImageVersionData.data.azurerm_shared_image_version.image_version["az-avd-img-ver-prod-2"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_shared_image_version" "image_version" {
      + exclude_from_latest   = (known after apply)
      + gallery_name          = "ig_avd_osimage_usgovaz_p01"
      + id                    = (known after apply)
      + image_name            = "idf-avd-win11-25h2-nvadsa10-usgovaz-p01"
      + location              = (known after apply)
      + managed_image_id      = (known after apply)
      + name                  = "1.0.0"
      + os_disk_image_size_gb = (known after apply)
      + os_disk_snapshot_id   = (known after apply)
      + resource_group_name   = "rg-avd-osimage-usgovaz-p01"
      + target_region         = (known after apply)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-1"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-10"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-11"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-12"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-13"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-14"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-15"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-16"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-17"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-18"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-2"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-22"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-3"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-4"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-5"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-6"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-7"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-8"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-4-9"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["az-avd-dce-prod-1-az-avd-sh-prod-5-1"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-1"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-1-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-1-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-10"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-10-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-10-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-11"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-11-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-11-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-12"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-12-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-12-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-13"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-13-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-13-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-14"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-14-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-14-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-15"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-15-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-15-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-16"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-16-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-16-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-17"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-17-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-17-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-18"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-18-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-18-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-2"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-2-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-2-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-22"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-22-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-22-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-3"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-3-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-3-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-4"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-4-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-4-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-5"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-5-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-5-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-6"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-6-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-6-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-7"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-7-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-7-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-8"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-8-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-8-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-4-9"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-9-assoc" -> (known after apply)
        name                    = "dcr-EWV0010001-9-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["az-avd-dcr-prod-1-az-avd-sh-prod-5-1"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0210001-1-assoc" -> (known after apply)
        name                    = "dcr-EWV0210001-1-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["hostpool-az-avd-hp-prod-1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovaz-p01-pr01"
    }

  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["hostpool-az-avd-hp-prod-2"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.DesktopVirtualization/hostPools/demo-hostpool"
    }

  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["workspace-az-avd-ws-prod-1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovaz-p01-pr01"
    }

  # module.ResourceGroup.azurerm_resource_group.rg["az-avd-rg-prod-5"] will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "usgovarizona"
      + name     = "rg-avd-automation-usgovaz-p01"
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/extensions/EWV0010001-1-domainjoin" -> (known after apply)
        name                        = "EWV0010001-1-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-10"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/extensions/EWV0010001-10-domainjoin" -> (known after apply)
        name                        = "EWV0010001-10-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-11"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/extensions/EWV0010001-11-domainjoin" -> (known after apply)
        name                        = "EWV0010001-11-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-12"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/extensions/EWV0010001-12-domainjoin" -> (known after apply)
        name                        = "EWV0010001-12-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-13"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/extensions/EWV0010001-13-domainjoin" -> (known after apply)
        name                        = "EWV0010001-13-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-14"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/extensions/EWV0010001-14-domainjoin" -> (known after apply)
        name                        = "EWV0010001-14-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-15"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/extensions/EWV0010001-15-domainjoin" -> (known after apply)
        name                        = "EWV0010001-15-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-16"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/extensions/EWV0010001-16-domainjoin" -> (known after apply)
        name                        = "EWV0010001-16-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-17"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/extensions/EWV0010001-17-domainjoin" -> (known after apply)
        name                        = "EWV0010001-17-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-18"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/extensions/EWV0010001-18-domainjoin" -> (known after apply)
        name                        = "EWV0010001-18-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-2"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/extensions/EWV0010001-2-domainjoin" -> (known after apply)
        name                        = "EWV0010001-2-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-22"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/extensions/EWV0010001-22-domainjoin" -> (known after apply)
        name                        = "EWV0010001-22-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-3"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/extensions/EWV0010001-3-domainjoin" -> (known after apply)
        name                        = "EWV0010001-3-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-4"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/extensions/EWV0010001-4-domainjoin" -> (known after apply)
        name                        = "EWV0010001-4-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-5"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/extensions/EWV0010001-5-domainjoin" -> (known after apply)
        name                        = "EWV0010001-5-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-6"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/extensions/EWV0010001-6-domainjoin" -> (known after apply)
        name                        = "EWV0010001-6-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-7"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/extensions/EWV0010001-7-domainjoin" -> (known after apply)
        name                        = "EWV0010001-7-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-8"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/extensions/EWV0010001-8-domainjoin" -> (known after apply)
        name                        = "EWV0010001-8-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-4-9"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/extensions/EWV0010001-9-domainjoin" -> (known after apply)
        name                        = "EWV0010001-9-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["az-avd-sh-prod-5-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/extensions/EWV0210001-1-domainjoin" -> (known after apply)
        name                        = "EWV0210001-1-domainjoin"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" # forces replacement -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/extensions/EWV0010001-1-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-1-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-10"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/extensions/EWV0010001-10-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-10-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-11"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/extensions/EWV0010001-11-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-11-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-12"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/extensions/EWV0010001-12-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-12-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-13"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/extensions/EWV0010001-13-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-13-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-14"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/extensions/EWV0010001-14-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-14-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-15"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/extensions/EWV0010001-15-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-15-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-16"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/extensions/EWV0010001-16-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-16-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-17"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/extensions/EWV0010001-17-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-17-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-18"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/extensions/EWV0010001-18-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-18-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-2"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/extensions/EWV0010001-2-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-2-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-22"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/extensions/EWV0010001-22-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-22-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-3"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/extensions/EWV0010001-3-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-3-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-4"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/extensions/EWV0010001-4-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-4-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-5"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/extensions/EWV0010001-5-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-5-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-6"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/extensions/EWV0010001-6-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-6-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-7"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/extensions/EWV0010001-7-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-7-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-8"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/extensions/EWV0010001-8-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-8-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-4-9"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/extensions/EWV0010001-9-extend-c-drive" -> (known after apply)
        name                        = "EWV0010001-9-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["az-avd-sh-prod-5-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/extensions/EWV0210001-1-extend-c-drive" -> (known after apply)
        name                        = "EWV0210001-1-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/extensions/EWV0010001-1-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-1-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-10"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/extensions/EWV0010001-10-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-10-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-11"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/extensions/EWV0010001-11-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-11-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-12"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/extensions/EWV0010001-12-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-12-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-13"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/extensions/EWV0010001-13-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-13-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-14"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/extensions/EWV0010001-14-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-14-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-15"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/extensions/EWV0010001-15-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-15-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-16"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/extensions/EWV0010001-16-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-16-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-17"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/extensions/EWV0010001-17-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-17-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-18"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/extensions/EWV0010001-18-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-18-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-2"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/extensions/EWV0010001-2-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-2-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-22"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/extensions/EWV0010001-22-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-22-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-3"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/extensions/EWV0010001-3-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-3-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-4"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/extensions/EWV0010001-4-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-4-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-5"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/extensions/EWV0010001-5-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-5-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-6"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/extensions/EWV0010001-6-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-6-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-7"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/extensions/EWV0010001-7-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-7-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-8"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/extensions/EWV0010001-8-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-8-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-4-9"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/extensions/EWV0010001-9-avd-dsc" -> (known after apply)
        name                        = "EWV0010001-9-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["az-avd-sh-prod-5-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/extensions/EWV0210001-1-avd-dsc" -> (known after apply)
        name                        = "EWV0210001-1-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-1"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-1" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" -> (known after apply)
        name                                                   = "EWV0010001-1"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-1_OsDisk_1_27f63da295104bd0a47dd6cea37ca651" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.7" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.7",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "3295e17b-ab3f-484f-8167-33f02589b7a6" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "24e648e6-4247-4b63-8ae2-d032fc5fa6a5" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-1_OsDisk_1_27f63da295104bd0a47dd6cea37ca651" -> (known after apply)
          ~ name                      = "EWV0010001-1_OsDisk_1_27f63da295104bd0a47dd6cea37ca651" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-10"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-10" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" -> (known after apply)
        name                                                   = "EWV0010001-10"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-10_OsDisk_1_755c2c1117134f59a500199d491c6119" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.28" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.28",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "b932f455-3951-4953-8ad5-e5b42441df11" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "d0f6419c-c3ca-4a76-8d3a-0760a58e36ff" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-10_OsDisk_1_755c2c1117134f59a500199d491c6119" -> (known after apply)
          ~ name                      = "EWV0010001-10_OsDisk_1_755c2c1117134f59a500199d491c6119" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-11"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-11" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" -> (known after apply)
        name                                                   = "EWV0010001-11"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-11_OsDisk_1_f88c46cc20b346e4a566b4305a9306a1" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.30" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.30",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "6084c0cf-3c23-4f31-a90e-832c17018730" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "03e9290d-638f-45d0-8c73-99f0a5dc405f" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-11_OsDisk_1_f88c46cc20b346e4a566b4305a9306a1" -> (known after apply)
          ~ name                      = "EWV0010001-11_OsDisk_1_f88c46cc20b346e4a566b4305a9306a1" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-12"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-12" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" -> (known after apply)
        name                                                   = "EWV0010001-12"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0010001-12_OsDisk_1_fef7216a289d466a99e9bec810977269" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.13" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.13",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "d0e1db6d-1b87-47f1-be4b-fe2991ec0dc1" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "acaa8da6-b4c4-4597-a5e5-d9fc17168a7a" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0010001-12_OsDisk_1_fef7216a289d466a99e9bec810977269" -> (known after apply)
          ~ name                      = "EWV0010001-12_OsDisk_1_fef7216a289d466a99e9bec810977269" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-13"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-13" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" -> (known after apply)
        name                                                   = "EWV0010001-13"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-13_OsDisk_1_2fc449a6d6e448f9a7cdb560843d4638" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.25" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.25",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "00691977-610e-45d7-a13d-7e4a7217f737" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "291ab3d2-674b-4871-aab2-5f3275f4e4e3" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-13_OsDisk_1_2fc449a6d6e448f9a7cdb560843d4638" -> (known after apply)
          ~ name                      = "EWV0010001-13_OsDisk_1_2fc449a6d6e448f9a7cdb560843d4638" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-14"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-14" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" -> (known after apply)
        name                                                   = "EWV0010001-14"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-14_OsDisk_1_ec1235a9d826468bb149f59fe094dcc3" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.24" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.24",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "3d5d96c8-5057-4125-b045-b587ca6787e4" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "08be65b1-c5ce-4b75-8d34-e6a322bef283" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-14_OsDisk_1_ec1235a9d826468bb149f59fe094dcc3" -> (known after apply)
          ~ name                      = "EWV0010001-14_OsDisk_1_ec1235a9d826468bb149f59fe094dcc3" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-15"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-15" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" -> (known after apply)
        name                                                   = "EWV0010001-15"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-15_OsDisk_1_8c7c19bdd0754afbaa4e2319a93701ff" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.20" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.20",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "94e03209-cad7-46f1-b800-085b37a1d139" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "80331b89-13c2-44b7-8b47-2335f173e918" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-15_OsDisk_1_8c7c19bdd0754afbaa4e2319a93701ff" -> (known after apply)
          ~ name                      = "EWV0010001-15_OsDisk_1_8c7c19bdd0754afbaa4e2319a93701ff" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-16"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-16" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" -> (known after apply)
        name                                                   = "EWV0010001-16"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0010001-16_OsDisk_1_d78b3e3e849a4706944f90f85beced75" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.34" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.34",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "d16f896c-9124-4e98-a619-f491da037b61" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "44199e36-cccf-4a79-86ab-1bef89ea51b6" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0010001-16_OsDisk_1_d78b3e3e849a4706944f90f85beced75" -> (known after apply)
          ~ name                      = "EWV0010001-16_OsDisk_1_d78b3e3e849a4706944f90f85beced75" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-17"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-17" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" -> (known after apply)
        name                                                   = "EWV0010001-17"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-17_OsDisk_1_74b3e5762446469f8fc3c97152455c86" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.14" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.14",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "a119fae2-b576-4ba8-b561-11a6945ca881" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "fc850d70-b77d-4f08-a6a7-98fe4e06b3d4" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-17_OsDisk_1_74b3e5762446469f8fc3c97152455c86" -> (known after apply)
          ~ name                      = "EWV0010001-17_OsDisk_1_74b3e5762446469f8fc3c97152455c86" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-18"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-18" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" -> (known after apply)
        name                                                   = "EWV0010001-18"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0010001-18_OsDisk_1_924a5ee367574ed9adc3cefafc15bd29" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.37" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.37",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "e098f134-4ba1-47b6-88ed-d03d8935287c" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "545d74bb-aa75-4f72-8349-fb25ef84f76e" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0010001-18_OsDisk_1_924a5ee367574ed9adc3cefafc15bd29" -> (known after apply)
          ~ name                      = "EWV0010001-18_OsDisk_1_924a5ee367574ed9adc3cefafc15bd29" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-2"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-2" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" -> (known after apply)
        name                                                   = "EWV0010001-2"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-2_OsDisk_1_ca26253d500740d7b8a3da7019163a75" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.32" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.32",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "8711b19b-ebde-45ad-b5d4-4442013eb027" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "54956ed7-1be5-40f1-b613-3a6f225ebbd2" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-2_OsDisk_1_ca26253d500740d7b8a3da7019163a75" -> (known after apply)
          ~ name                      = "EWV0010001-2_OsDisk_1_ca26253d500740d7b8a3da7019163a75" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-22"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-22" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" -> (known after apply)
        name                                                   = "EWV0010001-22"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-22_OsDisk_1_d1ac3a00b3f44da3b52ee096729d705e" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.36" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.36",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "98b93d0f-6eae-45ef-98de-789b1b23fc78" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "6df39772-5b38-4f1c-80d7-3558da986fa4" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-22_OsDisk_1_d1ac3a00b3f44da3b52ee096729d705e" -> (known after apply)
          ~ name                      = "EWV0010001-22_OsDisk_1_d1ac3a00b3f44da3b52ee096729d705e" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-3"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-3" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" -> (known after apply)
        name                                                   = "EWV0010001-3"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-3_OsDisk_1_f18d18ea886d4920909af5b75b886214" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.33" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.33",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "cf1a4655-cbf1-494f-9e4c-aada314c0b94" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "19d2a1cb-efa1-4c0a-84c7-298fdaac0e3d" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-3_OsDisk_1_f18d18ea886d4920909af5b75b886214" -> (known after apply)
          ~ name                      = "EWV0010001-3_OsDisk_1_f18d18ea886d4920909af5b75b886214" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-4"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-4" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" -> (known after apply)
        name                                                   = "EWV0010001-4"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-4_OsDisk_1_14cf252a293b43798ba02ff7301125f8" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.21" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.21",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "d8d15ad8-b3ab-407e-b033-0dde0789018c" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "62cb9aff-9c44-4f2e-b553-8a72f9aaf1b9" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-4_OsDisk_1_14cf252a293b43798ba02ff7301125f8" -> (known after apply)
          ~ name                      = "EWV0010001-4_OsDisk_1_14cf252a293b43798ba02ff7301125f8" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-5"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-5" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" -> (known after apply)
        name                                                   = "EWV0010001-5"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-5_OsDisk_1_bfef2a7faeb94c21b22e5f01ec4244b6" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.27" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.27",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "397ccf05-6ba6-4e18-ab90-c35f8aa7ffed" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "ec0e5515-d625-4e4d-9c69-4bf5728f32fd" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-5_OsDisk_1_bfef2a7faeb94c21b22e5f01ec4244b6" -> (known after apply)
          ~ name                      = "EWV0010001-5_OsDisk_1_bfef2a7faeb94c21b22e5f01ec4244b6" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-6"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-6" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" -> (known after apply)
        name                                                   = "EWV0010001-6"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-6_OsDisk_1_8e31d33951e14cf98594582ca5aeca88" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.23" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.23",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "2d23f482-355c-4003-81ea-ddab4f28c213" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "c7cfed21-ce1a-438e-becf-df196a882278" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-6_OsDisk_1_8e31d33951e14cf98594582ca5aeca88" -> (known after apply)
          ~ name                      = "EWV0010001-6_OsDisk_1_8e31d33951e14cf98594582ca5aeca88" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-7"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-7" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" -> (known after apply)
        name                                                   = "EWV0010001-7"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-7_OsDisk_1_839c573157a4448a9b637fd0e041d602" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.29" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.29",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "ce83e8d7-6c81-4746-a345-2450f03ef634" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "46511e24-0c1a-45f5-b63c-9a8148f8b108" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-7_OsDisk_1_839c573157a4448a9b637fd0e041d602" -> (known after apply)
          ~ name                      = "EWV0010001-7_OsDisk_1_839c573157a4448a9b637fd0e041d602" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-8"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-8" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" -> (known after apply)
        name                                                   = "EWV0010001-8"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-8_OsDisk_1_1dabe90d3fd745b39ae00bad050c147e" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.31" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.31",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "1e32d22f-93a8-4238-a52e-a786cce380ea" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "d69559ff-20f6-436d-9f4f-24e54c48a9cd" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-8_OsDisk_1_1dabe90d3fd745b39ae00bad050c147e" -> (known after apply)
          ~ name                      = "EWV0010001-8_OsDisk_1_1dabe90d3fd745b39ae00bad050c147e" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-4-9"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0010001-9" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" -> (known after apply)
        name                                                   = "EWV0010001-9"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-9_OsDisk_1_7a40a0d76da44e008b949f95d9eed1db" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.26" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.26",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "c4540153-66de-4fc2-8205-6b9236559014" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "98b17bdf-1908-4d1c-8e5d-49cccb4d5268" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/disks/EWV0010001-9_OsDisk_1_7a40a0d76da44e008b949f95d9eed1db" -> (known after apply)
          ~ name                      = "EWV0010001-9_OsDisk_1_7a40a0d76da44e008b949f95d9eed1db" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["az-avd-sh-prod-5-1"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWV0210001-1" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" -> (known after apply)
        name                                                   = "EWV0210001-1"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0210001-1_OsDisk_1_2e07d0753c904c0b8511cf85dd428aa0" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.240.12" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.240.12",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovaz-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovaz_p01/images/idf-avd-win11-25h2-nvadsa10-usgovaz-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "c6e38518-fe13-42d0-baaa-56ec7893a57a" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
        # (13 unchanged attributes hidden)

      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "f12b5fa6-46c9-4fea-b0f9-33a660873c2c" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }

      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVAZ-P01/providers/Microsoft.Compute/disks/EWV0210001-1_OsDisk_1_2e07d0753c904c0b8511cf85dd428aa0" -> (known after apply)
          ~ name                      = "EWV0210001-1_OsDisk_1_2e07d0753c904c0b8511cf85dd428aa0" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-1"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-10"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-11"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-12"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-13"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-14"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-15"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-16"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-17"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-18"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-2"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-22"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-3"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-4"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-5"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-6"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-7"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-8"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-4-9"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # module.SessionHost.module.NvidiaGpuDriverExtension["az-avd-sh-prod-5-1"].azurerm_virtual_machine_extension.nvidia_gpu_driver must be replaced
-/+ resource "azurerm_virtual_machine_extension" "nvidia_gpu_driver" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/extensions/nvidia-gpu-driver" -> (known after apply)
        name                        = "nvidia-gpu-driver"
      - provision_after_extensions  = [] -> null
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1" # forces replacement -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

Plan: 141 to add, 0 to change, 140 to destroy.

Changes to Outputs:
  ~ dceAssociation_id                          = {
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-1  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-10 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-11 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-12 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-13 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-14 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-15 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-16 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-17 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-18 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-2  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-22 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-3  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-4  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-5  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-6  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-7  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-8  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-4-9  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ az-avd-dce-prod-1-az-avd-sh-prod-5-1  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0210001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
    }
  ~ dcrAssociation_id                          = {
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-1  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-1-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-10 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-10/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-10-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-11 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-11-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-12 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-12/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-12-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-13 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-13-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-14 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-14/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-14-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-15 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-15/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-15-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-16 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-16/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-16-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-17 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-17/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-17-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-18 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-18-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-2  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-2-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-22 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-22/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-22-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-3  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-3-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-4  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-4-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-5  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-5-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-6  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-6/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-6-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-7  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-7/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-7-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-8  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-8/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-8-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-4-9  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Microsoft.Compute/virtualMachines/EWV0010001-9/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWV0010001-9-assoc" -> (known after apply)
      ~ az-avd-dcr-prod-1-az-avd-sh-prod-5-1  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovaz-p01/providers/Micro
