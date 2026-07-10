Run $ErrorActionPreference = "Stop"
data.azurerm_client_config.current: Reading...
module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-1"]: Reading...
data.azurerm_virtual_network.vnet["va-avd-snet-prod-3"]: Reading...
module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01]
data.azurerm_client_config.current: Read complete after 0s [id=Y2xpZW50Q29uZmlncy9jbGllbnRJZD01ODRkMDE3Mi00MDM0LTQxMjctYWVkMy1iZjcwMmI5NTliMjk7b2JqZWN0SWQ9NDdjYjQ5YzgtNDY0Ni00ZjIxLWEzMGEtOTI1NzdmOWNlNTY4O3N1YnNjcmlwdGlvbklkPTM2OGEyZDgxLWUzZDItNDc3Mi1iMWY2LTBlYmMzOGE2NzEyNTt0ZW5hbnRJZD1j***]
module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-2"]: Reading...
data.azurerm_virtual_network.vnet["va-avd-snet-prod-2"]: Read complete after 0s [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-3"]: Read complete after 0s [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-1"]: Read complete after 0s [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia]
module.Subnet.azurerm_subnet.snet["va-avd-snet-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-hostpool-usgovva-p01]
module.Subnet.azurerm_subnet.snet["va-avd-snet-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-osimagebuilder-usgovva-p01]
module.Subnet.azurerm_subnet.snet["va-avd-snet-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-privateendpoints-usgovva-p01]
module.Workspace.azurerm_virtual_desktop_workspace.Workspace["va-avd-ws-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovva-p01-pr01]
module.LogAnalyticsWorkspace.azurerm_log_analytics_workspace.LogAnalyticsWorkspace["va-avd-law-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.OperationalInsights/workspaces/law-avd-efe-usgovva-p01]
module.ActionGroup.azurerm_monitor_action_group.action_groups["va-avd-actiongroup-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/actionGroups/ag-avd-vm100-usgovva-p01]
module.Hostpool.azurerm_virtual_desktop_host_pool.hostpool["va-avd-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01]
module.Keyvault.azurerm_key_vault.Keyvault["va-avd-kv-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.KeyVault/vaults/kv-avd-usgovva-p01]
module.ComputeGallery.azurerm_shared_image_gallery.acg["va-avd-acg-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01]
module.ServiceHealthAlert.azurerm_monitor_activity_log_alert.service_health_alerts["va-avd-service-health-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/activityLogAlerts/alert-avd-servicehealth-usgovva-p01]
module.NetworkSecurityGroup.azurerm_network_security_group.nsg["va-avd-nsg-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-avd-privateendpoints-usgovva-p01]
module.NetworkSecurityGroup.azurerm_network_security_group.nsg["va-avd-nsg-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-avd-hostpool-usgovva-p01]
module.NetworkSecurityGroup.azurerm_network_security_group.nsg["va-avd-nsg-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-avd-osimagebuilder-usgovva-p01]
module.ComputeGalleryDefinition.azurerm_shared_image.image_def["va-avd-imagedef-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01]
module.ComputeGalleryDefinition.azurerm_shared_image.image_def["va-avd-imagedef-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-win11-25h2-nvadsa10-usgovva-p01]
module.ComputeGalleryDefinition.azurerm_shared_image.image_def["va-avd-imagedef-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-win11-25h2-ncast4-usgovva-p01]
module.ApplicationGroup.azurerm_virtual_desktop_application_group.applicationGroup["va-avd-ag-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/applicationGroups/app-avd-vm100-usgovva-p01]
module.ScalingPlan.azapi_resource.scalingPlan["va-avd-sp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/scalingPlans/scplan-avd-vm100-usgovva-p01]
module.DiagnosticSetting.azurerm_monitor_diagnostic_setting.DiagnosticSetting["hostpool-va-avd-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01|hstpl-avd-vm100-usgovva-p01-pr01-diag]
module.DiagnosticSetting.azurerm_monitor_diagnostic_setting.DiagnosticSetting["workspace-va-avd-ws-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovva-p01-pr01|wk-avd-vm100-usgovva-p01-pr01-diag]
module.nsgSubnetAssociation.azurerm_subnet_network_security_group_association.nsgSubnetAssociation["va-avd-nsgassoc-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-osimagebuilder-usgovva-p01]
module.nsgSubnetAssociation.azurerm_subnet_network_security_group_association.nsgSubnetAssociation["va-avd-nsgassoc-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-hostpool-usgovva-p01]
module.nsgSubnetAssociation.azurerm_subnet_network_security_group_association.nsgSubnetAssociation["va-avd-nsgassoc-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-privateendpoints-usgovva-p01]
module.PrivateEndPoint.azurerm_private_endpoint.pvtEndpoint["va-avd-pe-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/privateEndpoints/pe-avd-hstpl-vm100-usgovva-p01-pr01]
module.PrivateEndPoint.azurerm_private_endpoint.pvtEndpoint["va-avd-pe-kv-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/privateEndpoints/pe-avd-kv-usgovva-p01-pr01]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-13-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-3-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-5-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-4-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-2-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-1-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-18-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-11-nic]
module.ApplicationGroupAssignment.azurerm_role_assignment.avd_assignment["va-avd-group-assignment-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/applicationGroups/app-avd-vm100-usgovva-p01/providers/Microsoft.Authorization/roleAssignments/b76e944c-f3cb-374b-444b-2ac3402e55f1]
module.WorkspaceApplicationGroupAssociation.azurerm_virtual_desktop_workspace_application_group_association.workspaceApplicationGroupAssociation["va-avd-wsassoc-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovva-p01-pr01|/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/applicationGroups/app-avd-vm100-usgovva-p01]
module.SessionHost.azurerm_virtual_desktop_host_pool_registration_info.rg_token["va-avd-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/registrationInfo/default]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-extend-c-drive]
module.ScalingPlan.azapi_resource.personalSchedule["va-avd-sp-prod-1-Weekdays"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/scalingPlans/scplan-avd-vm100-usgovva-p01/personalSchedules/Weekdays]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-avd-dsc]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-11.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-4.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-3.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-5.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-18.FED.etnfederal.com]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/va-avd-sh-prod-2-5-ama]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-2.FED.etnfederal.com]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/va-avd-sh-prod-1-1-ama]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-1.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-13.FED.etnfederal.com]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/va-avd-sh-prod-1-3-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/va-avd-sh-prod-2-13-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/va-avd-sh-prod-2-11-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/va-avd-sh-prod-1-2-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/va-avd-sh-prod-2-4-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/va-avd-sh-prod-2-18-ama]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-11"]: Refreshing state... [id=2026-04-01T17:19:09Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-13"]: Refreshing state... [id=2026-04-07T09:14:24Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-1-3"]: Refreshing state... [id=2026-04-01T09:47:27Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-1-1"]: Refreshing state... [id=2026-04-01T09:47:27Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-5"]: Refreshing state... [id=2026-06-04T09:17:15Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-18"]: Refreshing state... [id=2026-04-07T09:14:24Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-1-2"]: Refreshing state... [id=2026-04-01T09:47:27Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-4"]: Refreshing state... [id=2026-04-01T17:19:09Z]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/start]
module.DCE.azurerm_monitor_data_collection_endpoint.dce["va-avd-dce-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/dataCollectionEndpoints/dce-avd-vm100-usgovva-p01]
module.DCR.azurerm_monitor_data_collection_rule.dcr["va-avd-dcr-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/dataCollectionRules/dcr-avd-vm100-usgovva-p01]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-13-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-11-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-18-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-4-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-5-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-1-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-3-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-2-assoc]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-cpu-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-cpu-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-network-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-network-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-diskfree-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-diskfree-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-memory-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-memory-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-disklatency-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-disklatency-usgovva-p01]
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create
-/+ destroy and then create replacement
 <= read (data resources)
Terraform will perform the following actions:
  # data.azurerm_key_vault.session_host["va-avd-sh-prod-1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_key_vault" "session_host" {
      + access_policy                   = (known after apply)
      + enable_rbac_authorization       = (known after apply)
      + enabled_for_deployment          = (known after apply)
      + enabled_for_disk_encryption     = (known after apply)
      + enabled_for_template_deployment = (known after apply)
      + id                              = (known after apply)
      + location                        = (known after apply)
      + name                            = "kv-avd-usgovva-p01"
      + network_acls                    = (known after apply)
      + public_network_access_enabled   = (known after apply)
      + purge_protection_enabled        = (known after apply)
      + rbac_authorization_enabled      = (known after apply)
      + resource_group_name             = "rg-avd-vm100-usgovva-p01"
      + sku_name                        = (known after apply)
      + tags                            = (known after apply)
      + tenant_id                       = (known after apply)
      + vault_uri                       = (known after apply)
    }
  # data.azurerm_key_vault.session_host["va-avd-sh-prod-2"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_key_vault" "session_host" {
      + access_policy                   = (known after apply)
      + enable_rbac_authorization       = (known after apply)
      + enabled_for_deployment          = (known after apply)
      + enabled_for_disk_encryption     = (known after apply)
      + enabled_for_template_deployment = (known after apply)
      + id                              = (known after apply)
      + location                        = (known after apply)
      + name                            = "kv-avd-usgovva-p01"
      + network_acls                    = (known after apply)
      + public_network_access_enabled   = (known after apply)
      + purge_protection_enabled        = (known after apply)
      + rbac_authorization_enabled      = (known after apply)
      + resource_group_name             = "rg-avd-vm100-usgovva-p01"
      + sku_name                        = (known after apply)
      + tags                            = (known after apply)
      + tenant_id                       = (known after apply)
      + vault_uri                       = (known after apply)
    }
  # data.azurerm_key_vault.session_host["va-avd-sh-prod-3"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_key_vault" "session_host" {
      + access_policy                   = (known after apply)
      + enable_rbac_authorization       = (known after apply)
      + enabled_for_deployment          = (known after apply)
      + enabled_for_disk_encryption     = (known after apply)
      + enabled_for_template_deployment = (known after apply)
      + id                              = (known after apply)
      + location                        = (known after apply)
      + name                            = "kv-avd-usgovva-p01"
      + network_acls                    = (known after apply)
      + public_network_access_enabled   = (known after apply)
      + purge_protection_enabled        = (known after apply)
      + rbac_authorization_enabled      = (known after apply)
      + resource_group_name             = "rg-avd-vm100-usgovva-p01"
      + sku_name                        = (known after apply)
      + tags                            = (known after apply)
      + tenant_id                       = (known after apply)
      + vault_uri                       = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-1"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_admin_password" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-sessionhost-pass"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-2"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_admin_password" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-sessionhost-pass"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-3"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_admin_password" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-sessionhost-pass"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-1"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_admin_username" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-sessionhost-uname"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-2"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_admin_username" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-sessionhost-uname"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-3"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_admin_username" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-sessionhost-uname"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-1"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_domain_join_password" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-domainjoin-pass"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-2"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_domain_join_password" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-domainjoin-pass"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-3"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_domain_join_password" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-domainjoin-pass"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-1"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_domain_join_username" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-domainjoin-uname"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-2"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_domain_join_username" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-domainjoin-uname"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-3"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_key_vault_secret" "session_host_domain_join_username" {
      + content_type            = (known after apply)
      + expiration_date         = (known after apply)
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "etn-avd-domainjoin-uname"
      + not_before_date         = (known after apply)
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = (known after apply)
      + value                   = (sensitive value)
      + versionless_id          = (known after apply)
    }
  # module.ComputeGalleryImageVersionData.data.azurerm_shared_image_version.image_version["va_avd_img_ver_prod_1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_shared_image_version" "image_version" {
      + exclude_from_latest   = (known after apply)
      + gallery_name          = "ig_avd_osimage_usgovva_p01"
      + id                    = (known after apply)
      + image_name            = "idf-avd-osimage-w11ss-25h2-usgovva-p01"
      + location              = (known after apply)
      + managed_image_id      = (known after apply)
      + name                  = "1.0.0"
      + os_disk_image_size_gb = (known after apply)
      + os_disk_snapshot_id   = (known after apply)
      + resource_group_name   = "rg-avd-osimage-usgovva-p01"
      + target_region         = (known after apply)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dce_association" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
        name                        = "configurationAccessEndpoint"
      ~ target_resource_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-1-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-1-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-2-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-2-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-3-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-3-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-11-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-11-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-13-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-13-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-18-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-18-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-4-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-4-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
      ~ id                      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-5-assoc" -> (known after apply)
        name                    = "dcr-EWAPV10001-5-assoc"
      ~ target_resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5" # forces replacement -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }
  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["hostpool-va-avd-hp-prod-1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01"
    }
  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["workspace-va-avd-ws-prod-1"] will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovva-p01-pr01"
    }
  # module.Keyvault.data.azurerm_client_config.current will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "azurerm_client_config" "current" {
      + client_id       = (known after apply)
      + id              = (known after apply)
      + object_id       = (known after apply)
      + subscription_id = (known after apply)
      + tenant_id       = (known after apply)
    }
  # module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-4"] will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "usgovvirginia"
      + name     = "rg-avd-logs-usgovva-p01"
    }
  # module.SessionHost.azurerm_virtual_desktop_host_pool_registration_info.rg_token["va-avd-hp-prod-1"] will be created
  + resource "azurerm_virtual_desktop_host_pool_registration_info" "rg_token" {
      + expiration_date = (known after apply)
      + hostpool_id     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01"
      + id              = (known after apply)
      + token           = (sensitive value)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-1-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-2-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-3-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-11-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-13-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-18-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-4-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "domain_join" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-domainjoin" -> (known after apply)
        name                        = "EWAPV10001-5-domainjoin"
      ~ protected_settings          = (sensitive value)
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5" # forces replacement -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-1-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-2-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-3-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-11-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-13-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-18-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-4-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "extend_os_disk" {
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-extend-c-drive" -> (known after apply)
        name                        = "EWAPV10001-5-extend-c-drive"
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5" # forces replacement -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-1-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-2-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-3-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-11-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-13-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-18-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-4-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azurerm_virtual_machine_extension" "vmext_dsc" {
      - automatic_upgrade_enabled   = false -> null
      ~ id                          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-avd-dsc" -> (known after apply)
        name                        = "EWAPV10001-5-avd-dsc"
      - provision_after_extensions  = [] -> null
      ~ settings                    = (sensitive value)
      - tags                        = {} -> null
      ~ virtual_machine_id          = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5" # forces replacement -> (known after apply) # forces replacement
        # (5 unchanged attributes hidden)
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-1" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1" -> (known after apply)
        name                                                   = "EWAPV10001-1"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-1_OsDisk_1_cf773387b2c746b799595191f3c82df9" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.11" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.11",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "2f82e416-b748-4193-b0ad-d5b332f178c9" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "f8283eb5-83af-4798-ad63-404a686485c8" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-1_OsDisk_1_cf773387b2c746b799595191f3c82df9" -> (known after apply)
          ~ name                      = "EWAPV10001-1_OsDisk_1_cf773387b2c746b799595191f3c82df9" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-2" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2" -> (known after apply)
        name                                                   = "EWAPV10001-2"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-2_OsDisk_1_31320c8539fa45ce9dedca150a0261cc" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.5" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.5",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "6c4560eb-a481-4744-8f5c-ba1493319188" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "1502ebda-fd3c-4a3d-a473-b0e1516cc3c5" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-2_OsDisk_1_31320c8539fa45ce9dedca150a0261cc" -> (known after apply)
          ~ name                      = "EWAPV10001-2_OsDisk_1_31320c8539fa45ce9dedca150a0261cc" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-3" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3" -> (known after apply)
        name                                                   = "EWAPV10001-3"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-3_OsDisk_1_3732ade5f7fa4296a44da593d320fc73" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.4" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.4",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "546b5908-3bbf-4f8a-a0ab-28591b950f91" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "1d4ef0df-60f6-4c10-8d41-21b0c86d6596" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-3_OsDisk_1_3732ade5f7fa4296a44da593d320fc73" -> (known after apply)
          ~ name                      = "EWAPV10001-3_OsDisk_1_3732ade5f7fa4296a44da593d320fc73" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-11" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11" -> (known after apply)
        name                                                   = "EWAPV10001-11"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-11_OsDisk_1_67688bbd73c34dd08716cd22bdd3e8c6" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.16" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.16",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "215bf7e5-7c8b-4ffe-bfc2-e3341c729ae9" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "a9d8ec1b-dc95-4266-8408-3f7dcffffddb" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-11_OsDisk_1_67688bbd73c34dd08716cd22bdd3e8c6" -> (known after apply)
          ~ name                      = "EWAPV10001-11_OsDisk_1_67688bbd73c34dd08716cd22bdd3e8c6" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-13" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13" -> (known after apply)
        name                                                   = "EWAPV10001-13"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-13_OsDisk_1_c6a7af50e46847f89220ea842c13bae5" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.27" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.27",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "2ff48224-4b82-4b3e-bf95-a3aa091c9abd" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "72ec0e82-8232-4d80-bd0b-9bc7998ec916" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-13_OsDisk_1_c6a7af50e46847f89220ea842c13bae5" -> (known after apply)
          ~ name                      = "EWAPV10001-13_OsDisk_1_c6a7af50e46847f89220ea842c13bae5" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-18" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18" -> (known after apply)
        name                                                   = "EWAPV10001-18"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-18_OsDisk_1_c7694c0d8bb24c7882b268cd237809bd" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.20" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.20",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "1f2a9c72-7de6-421d-8811-bf8736fcfb5c" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "0016d8a6-eb3d-4aa0-b2cf-ad01ef2dbfa3" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-18_OsDisk_1_c7694c0d8bb24c7882b268cd237809bd" -> (known after apply)
          ~ name                      = "EWAPV10001-18_OsDisk_1_c7694c0d8bb24c7882b268cd237809bd" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-4" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4" -> (known after apply)
        name                                                   = "EWAPV10001-4"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-4_OsDisk_1_0f8ea30b2af1441ebcff7256cea5422c" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.14" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.14",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "046cbad8-8f57-4d13-b22e-9066f8a36e08" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "154192f5-1056-4610-a8de-7b011045448e" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/RG-AVD-VM100-USGOVVA-P01/providers/Microsoft.Compute/disks/EWAPV10001-4_OsDisk_1_0f8ea30b2af1441ebcff7256cea5422c" -> (known after apply)
          ~ name                      = "EWAPV10001-4_OsDisk_1_0f8ea30b2af1441ebcff7256cea5422c" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
  # module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azurerm_windows_virtual_machine" "avd_vm" {
      ~ admin_password                                         = (sensitive value) # forces replacement
      # Warning: this attribute value will no longer be marked as sensitive
      # after applying this change.
      ~ admin_username                                         = (sensitive value) # forces replacement
      ~ allow_extension_operations                             = true -> (known after apply)
      ~ automatic_updates_enabled                              = true -> (known after apply)
      ~ computer_name                                          = "EWAPV10001-5" -> (known after apply)
      ~ disk_controller_type                                   = "SCSI" -> (known after apply)
      ~ enable_automatic_updates                               = true -> (known after apply)
      - encryption_at_host_enabled                             = false -> null
      ~ hotpatching_enabled                                    = false -> (known after apply)
      ~ id                                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5" -> (known after apply)
        name                                                   = "EWAPV10001-5"
      ~ os_managed_disk_id                                     = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/disks/EWAPV10001-5_OsDisk_1_45a1dd55ceae4587a83b009fda244c68" -> (known after apply)
      ~ patch_assessment_mode                                  = "ImageDefault" -> (known after apply)
      ~ patch_mode                                             = "AutomaticByOS" -> (known after apply)
      ~ private_ip_address                                     = "10.248.112.12" -> (known after apply)
      ~ private_ip_addresses                                   = [
          - "10.248.112.12",
        ] -> (known after apply)
      ~ provision_vm_agent                                     = true -> (known after apply)
      + public_ip_address                                      = (known after apply)
      ~ public_ip_addresses                                    = [] -> (known after apply)
      - secure_boot_enabled                                    = false -> null
      ~ source_image_id                                        = "/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0" # forces replacement -> (known after apply) # forces replacement
        tags                                                   = {
            "az_res_costcenter" = "5100-42358"
        }
      ~ virtual_machine_id                                     = "51949fbb-dc8e-4ab3-b4f1-777a773762cc" -> (known after apply)
      ~ vm_agent_platform_updates_enabled                      = true -> (known after apply)
      - vtpm_enabled                                           = false -> null
        # (9 unchanged attributes hidden)
      ~ identity {
          - identity_ids = [] -> null
          ~ principal_id = "1e352952-e187-49d1-969e-cc2bc2c1dd26" -> (known after apply)
          ~ tenant_id    = "***" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
      ~ os_disk {
          ~ id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/disks/EWAPV10001-5_OsDisk_1_45a1dd55ceae4587a83b009fda244c68" -> (known after apply)
          ~ name                      = "EWAPV10001-5_OsDisk_1_45a1dd55ceae4587a83b009fda244c68" -> (known after apply)
            # (4 unchanged attributes hidden)
        }
    }
Plan: 50 to add, 0 to change, 48 to destroy.
Changes to Outputs:
  ~ dceAssociation_id                          = {
      ~ va-avd-dce-prod-1-va-avd-sh-prod-1-1  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ va-avd-dce-prod-1-va-avd-sh-prod-1-2  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ va-avd-dce-prod-1-va-avd-sh-prod-1-3  = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ va-avd-dce-prod-1-va-avd-sh-prod-2-11 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
      ~ va-avd-dce-prod-1-va-avd-sh-prod-2-13 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint" -> (known after apply)
1s
Run $artifactDir = "C:/artifacts/virginia"
  
1s
Node 20 is being deprecated. This workflow is running with Node 24 by default. If you need to temporarily use Node 20, you can set the ACTIONS_ALLOW_USE_UNSECURE_NODE_VERSION=true environment variable. For more information see: https://github.blog/changelog/2025-09-19-deprecation-of-node-20-on-github-actions-runners/
Post job cleanup.
Clearing azure cli accounts from the local cache.
C:\Windows\system32\cmd.exe /D /S /C ""C:\Program Files\Microsoft SDKs\Azure\CLI2\wbin\az.cmd" account clear"
0s
Post job cleanup.
