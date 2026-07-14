Run $ErrorActionPreference = "Stop"
data.azurerm_virtual_network.vnet["va-avd-snet-prod-2"]: Reading...
data.azurerm_virtual_network.vnet["va-avd-snet-prod-1"]: Reading...
module.Keyvault.data.azurerm_client_config.current: Reading...
module.ComputeGalleryImageVersionData.data.azurerm_shared_image_version.image_version["va_avd_img_ver_prod_1"]: Reading...
module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-3"]: Reading...
module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01]
data.azurerm_client_config.current: Reading...
module.ResourceGroup.azurerm_resource_group.rg["va-avd-rg-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01]
module.Keyvault.data.azurerm_client_config.current: Read complete after 0s [id=Y2xpZW50Q29uZmlncy9jbGllbnRJZD01ODRkMDE3Mi00MDM0LTQxMjctYWVkMy1iZjcwMmI5NTliMjk7b2JqZWN0SWQ9NDdjYjQ5YzgtNDY0Ni00ZjIxLWEzMGEtOTI1NzdmOWNlNTY4O3N1YnNjcmlwdGlvbklkPTM2OGEyZDgxLWUzZDItNDc3Mi1iMWY2LTBlYmMzOGE2NzEyNTt0ZW5hbnRJZD1j***]
data.azurerm_client_config.current: Read complete after 0s [id=Y2xpZW50Q29uZmlncy9jbGllbnRJZD01ODRkMDE3Mi00MDM0LTQxMjctYWVkMy1iZjcwMmI5NTliMjk7b2JqZWN0SWQ9NDdjYjQ5YzgtNDY0Ni00ZjIxLWEzMGEtOTI1NzdmOWNlNTY4O3N1YnNjcmlwdGlvbklkPTM2OGEyZDgxLWUzZDItNDc3Mi1iMWY2LTBlYmMzOGE2NzEyNTt0ZW5hbnRJZD1j***]
module.Keyvault.azurerm_key_vault.Keyvault["va-avd-kv-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.KeyVault/vaults/kv-avd-usgovva-p01]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-3"]: Read complete after 1s [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-1"]: Read complete after 1s [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia]
module.ComputeGallery.azurerm_shared_image_gallery.acg["va-avd-acg-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01]
data.azurerm_virtual_network.vnet["va-avd-snet-prod-2"]: Read complete after 1s [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia]
module.LogAnalyticsWorkspace.azurerm_log_analytics_workspace.LogAnalyticsWorkspace["va-avd-law-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.OperationalInsights/workspaces/law-avd-efe-usgovva-p01]
module.Hostpool.azurerm_virtual_desktop_host_pool.hostpool["va-avd-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01]
module.ActionGroup.azurerm_monitor_action_group.action_groups["va-avd-actiongroup-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/actionGroups/ag-avd-vm100-usgovva-p01]
module.Workspace.azurerm_virtual_desktop_workspace.Workspace["va-avd-ws-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovva-p01-pr01]
module.Subnet.azurerm_subnet.snet["va-avd-snet-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-osimagebuilder-usgovva-p01]
module.Subnet.azurerm_subnet.snet["va-avd-snet-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-hostpool-usgovva-p01]
module.Subnet.azurerm_subnet.snet["va-avd-snet-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-privateendpoints-usgovva-p01]
module.ComputeGalleryImageVersionData.data.azurerm_shared_image_version.image_version["va_avd_img_ver_prod_1"]: Read complete after 1s [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01/versions/1.0.0]
module.ComputeGalleryDefinition.azurerm_shared_image.image_def["va-avd-imagedef-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-win11-25h2-ncast4-usgovva-p01]
module.ComputeGalleryDefinition.azurerm_shared_image.image_def["va-avd-imagedef-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-osimage-w11ss-25h2-usgovva-p01]
module.ComputeGalleryDefinition.azurerm_shared_image.image_def["va-avd-imagedef-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-osimage-usgovva-p01/providers/Microsoft.Compute/galleries/ig_avd_osimage_usgovva_p01/images/idf-avd-win11-25h2-nvadsa10-usgovva-p01]
module.ApplicationGroup.azurerm_virtual_desktop_application_group.applicationGroup["va-avd-ag-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/applicationGroups/app-avd-vm100-usgovva-p01]
module.ScalingPlan.azapi_resource.scalingPlan["va-avd-sp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/scalingPlans/scplan-avd-vm100-usgovva-p01]
module.NetworkSecurityGroup.azurerm_network_security_group.nsg["va-avd-nsg-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-avd-osimagebuilder-usgovva-p01]
module.NetworkSecurityGroup.azurerm_network_security_group.nsg["va-avd-nsg-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-avd-hostpool-usgovva-p01]
module.NetworkSecurityGroup.azurerm_network_security_group.nsg["va-avd-nsg-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-avd-privateendpoints-usgovva-p01]
module.DiagnosticSetting.azurerm_monitor_diagnostic_setting.DiagnosticSetting["hostpool-va-avd-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01|hstpl-avd-vm100-usgovva-p01-pr01-diag]
module.DiagnosticSetting.azurerm_monitor_diagnostic_setting.DiagnosticSetting["workspace-va-avd-ws-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/workspaces/wk-avd-vm100-usgovva-p01-pr01|wk-avd-vm100-usgovva-p01-pr01-diag]
module.ServiceHealthAlert.azurerm_monitor_activity_log_alert.service_health_alerts["va-avd-service-health-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/activityLogAlerts/alert-avd-servicehealth-usgovva-p01]
data.azurerm_key_vault.session_host["va-avd-sh-prod-3"]: Reading...
data.azurerm_key_vault.session_host["va-avd-sh-prod-2"]: Reading...
data.azurerm_key_vault.session_host["va-avd-sh-prod-1"]: Reading...
module.PrivateEndPoint.azurerm_private_endpoint.pvtEndpoint["va-avd-pe-kv-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/privateEndpoints/pe-avd-kv-usgovva-p01-pr01]
module.PrivateEndPoint.azurerm_private_endpoint.pvtEndpoint["va-avd-pe-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/privateEndpoints/pe-avd-hstpl-vm100-usgovva-p01-pr01]
module.nsgSubnetAssociation.azurerm_subnet_network_security_group_association.nsgSubnetAssociation["va-avd-nsgassoc-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-hostpool-usgovva-p01]
module.nsgSubnetAssociation.azurerm_subnet_network_security_group_association.nsgSubnetAssociation["va-avd-nsgassoc-prod-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-osimagebuilder-usgovva-p01]
data.azurerm_key_vault.session_host["va-avd-sh-prod-3"]: Read complete after 0s [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.KeyVault/vaults/kv-avd-usgovva-p01]
module.nsgSubnetAssociation.azurerm_subnet_network_security_group_association.nsgSubnetAssociation["va-avd-nsgassoc-prod-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-network-infra-prod/providers/Microsoft.Network/virtualNetworks/vnet-avd-prod-usgovvirginia/subnets/snet-avd-privateendpoints-usgovva-p01]
data.azurerm_key_vault.session_host["va-avd-sh-prod-2"]: Read complete after 0s [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.KeyVault/vaults/kv-avd-usgovva-p01]
data.azurerm_key_vault.session_host["va-avd-sh-prod-1"]: Read complete after 0s [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.KeyVault/vaults/kv-avd-usgovva-p01]
data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-2"]: Reading...
data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-3"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-2"]: Reading...
data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-2"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-domainjoin-pass/eade1ba1851e4b3f89814e06d3c20704]
data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-1"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-3"]: Reading...
data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-1"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-domainjoin-pass/eade1ba1851e4b3f89814e06d3c20704]
data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-1"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-1"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-3"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-sessionhost-pass/a350602145fa44c9afcd749b2707a7db]
data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-3"]: Reading...
data.azurerm_key_vault_secret.session_host_domain_join_password["va-avd-sh-prod-3"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-domainjoin-pass/eade1ba1851e4b3f89814e06d3c20704]
data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-2"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-2"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-sessionhost-pass/a350602145fa44c9afcd749b2707a7db]
data.azurerm_key_vault_secret.session_host_admin_password["va-avd-sh-prod-1"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-sessionhost-pass/a350602145fa44c9afcd749b2707a7db]
data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-2"]: Reading...
data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-3"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-1"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-sessionhost-uname/7988f5a930284a0db1e975a8a3be7ee5]
data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-1"]: Reading...
data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-2"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-sessionhost-uname/7988f5a930284a0db1e975a8a3be7ee5]
data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-3"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-domainjoin-uname/6a756da6c15b40f28840ecd6f6d806cd]
data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-2"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-domainjoin-uname/6a756da6c15b40f28840ecd6f6d806cd]
data.azurerm_key_vault_secret.session_host_domain_join_username["va-avd-sh-prod-1"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-domainjoin-uname/6a756da6c15b40f28840ecd6f6d806cd]
data.azurerm_key_vault_secret.session_host_admin_username["va-avd-sh-prod-3"]: Read complete after 0s [id=https://kv-avd-usgovva-p01.vault.usgovcloudapi.net/secrets/etn-avd-sessionhost-uname/7988f5a930284a0db1e975a8a3be7ee5]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-2-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-11-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-4-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-3-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-1-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-5-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-13-nic]
module.NetworkInterface.azurerm_network_interface.nic["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Network/networkInterfaces/EWAPV10001-18-nic]
module.SessionHost.azurerm_virtual_desktop_host_pool_registration_info.rg_token["va-avd-hp-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/registrationInfo/default]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11]
module.SessionHost.azurerm_windows_virtual_machine.avd_vm["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13]
module.ScalingPlan.azapi_resource.personalSchedule["va-avd-sp-prod-1-Weekdays"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/scalingPlans/scplan-avd-vm100-usgovva-p01/personalSchedules/Weekdays]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.extend_os_disk["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-extend-c-drive]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.domain_join["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-domainjoin]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/EWAPV10001-11-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/EWAPV10001-5-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/EWAPV10001-1-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/EWAPV10001-13-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/EWAPV10001-18-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/EWAPV10001-3-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/EWAPV10001-2-avd-dsc]
module.SessionHost.azurerm_virtual_machine_extension.vmext_dsc["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/EWAPV10001-4-avd-dsc]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-2.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-11.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-18.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-1.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-13.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-3.FED.etnfederal.com]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/extensions/va-avd-sh-prod-1-2-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/extensions/va-avd-sh-prod-2-18-ama]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-5.FED.etnfederal.com]
module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-4.FED.etnfederal.com]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/extensions/va-avd-sh-prod-2-13-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/extensions/va-avd-sh-prod-2-4-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/extensions/va-avd-sh-prod-1-1-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/extensions/va-avd-sh-prod-1-3-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/extensions/va-avd-sh-prod-2-5-ama]
module.AzureMonitorAgent.azurerm_virtual_machine_extension.ama["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/extensions/va-avd-sh-prod-2-11-ama]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-1-2"]: Refreshing state... [id=2026-04-01T09:47:27Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-13"]: Refreshing state... [id=2026-04-07T09:14:24Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-5"]: Refreshing state... [id=2026-06-04T09:17:15Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-11"]: Refreshing state... [id=2026-04-01T17:19:09Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-18"]: Refreshing state... [id=2026-04-07T09:14:24Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-1-3"]: Refreshing state... [id=2026-04-01T09:47:27Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-1-1"]: Refreshing state... [id=2026-04-01T09:47:27Z]
module.AzureMonitorAgent.time_sleep.wait_for_vm_after_start["va-avd-sh-prod-2-4"]: Refreshing state... [id=2026-04-01T17:19:09Z]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/start]
module.AzureMonitorAgent.azapi_resource_action.start_vm_before_ama_destroy["va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/start]
module.DCE.azurerm_monitor_data_collection_endpoint.dce["va-avd-dce-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/dataCollectionEndpoints/dce-avd-vm100-usgovva-p01]
module.DCR.azurerm_monitor_data_collection_rule.dcr["va-avd-dcr-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/dataCollectionRules/dcr-avd-vm100-usgovva-p01]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCEAssociation.azurerm_monitor_data_collection_rule_association.dce_association["va-avd-dce-prod-1-va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/configurationAccessEndpoint]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-11"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-11/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-11-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-18"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-18/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-18-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-1/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-1-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-2"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-2/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-2-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-13"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-13/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-13-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-1-3"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-3/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-3-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-4"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-4/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-4-assoc]
module.DCRAssociation.azurerm_monitor_data_collection_rule_association.dcr_association["va-avd-dcr-prod-1-va-avd-sh-prod-2-5"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.Compute/virtualMachines/EWAPV10001-5/providers/Microsoft.Insights/dataCollectionRuleAssociations/dcr-EWAPV10001-5-assoc]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-diskfree-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-diskfree-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-cpu-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-cpu-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-memory-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-memory-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-disklatency-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-disklatency-usgovva-p01]
module.Alerts.azurerm_monitor_scheduled_query_rules_alert_v2.alerts["va-avd-alert-network-prod-1"]: Refreshing state... [id=/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.Insights/scheduledQueryRules/alert-avd-network-usgovva-p01]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place
-/+ destroy and then create replacement
 <= read (data resources)

Terraform planned the following actions, but then encountered a problem:

  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["hostpool-va-avd-hp-prod-1"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = (known after apply)
    }

  # module.DiagnosticSetting.data.azurerm_monitor_diagnostic_categories.Diagnostic["hostpool-va-avd-hp-prod-2"] will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_monitor_diagnostic_categories" "Diagnostic" {
      + id                  = (known after apply)
      + log_category_groups = (known after apply)
      + log_category_types  = (known after apply)
      + metrics             = (known after apply)
      + resource_id         = (known after apply)
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

Error: Instance cannot be destroyed

  on ..\..\modules\ApplicationGroup\main.tf line 4:
   4: resource "azurerm_virtual_desktop_application_group" "applicationGroup" {

Resource
module.ApplicationGroup.azurerm_virtual_desktop_application_group.applicationGroup["va-avd-ag-prod-1"]
has lifecycle.prevent_destroy set, but the plan calls for this resource to be
destroyed. To avoid this error and continue with the plan, either disable
lifecycle.prevent_destroy or reduce the scope of the plan using the -target
flag.

  # module.DiagnosticSetting.azurerm_monitor_diagnostic_setting.DiagnosticSetting["hostpool-va-avd-hp-prod-1"] must be replaced
-/+ resource "azurerm_monitor_diagnostic_setting" "DiagnosticSetting" {
      ~ id                             = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01|hstpl-avd-vm100-usgovva-p01-pr01-diag" -> (known after apply)
      + log_analytics_destination_type = "Dedicated"
        name                           = "hstpl-avd-vm100-usgovva-p01-pr01-diag"
      ~ target_resource_id             = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01" # forces replacement -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)

      - enabled_log {
          - category = "AgentHealthStatus" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "Checkpoint" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "Connection" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "Error" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "HostRegistration" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "Management" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "NetworkData" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
      - enabled_log {
          - category = "SessionHostManagement" -> null

          - retention_policy {
              - days    = 0 -> null
              - enabled = false -> null
            }
        }
    }

  # module.DiagnosticSetting.azurerm_monitor_diagnostic_setting.DiagnosticSetting["hostpool-va-avd-hp-prod-2"] will be created
  + resource "azurerm_monitor_diagnostic_setting" "DiagnosticSetting" {
      + id                             = (known after apply)
      + log_analytics_destination_type = "Dedicated"
      + log_analytics_workspace_id     = "/subscriptions/***/resourceGroups/rg-avd-logs-usgovva-p01/providers/Microsoft.OperationalInsights/workspaces/law-avd-efe-usgovva-p01"
      + name                           = "demo-diag"
      + target_resource_id             = (known after apply)
    }

  # module.Hostpool.azurerm_virtual_desktop_host_pool.hostpool["va-avd-hp-prod-1"] must be replaced
-/+ resource "azurerm_virtual_desktop_host_pool" "hostpool" {
      ~ custom_rdp_properties            = "audiocapturemode:i:1;audiomode:i:0;videoplaybackmode:i:1;quality:i:1;capture:i:1;enablecredsspsupport:i:1;camerastoredirect:s:*;devicestoredirect:s:;drivestoredirect:s:;redirectclipboard:i:0;redirectcomports:i:0;redirectlocation:i:0;redirectprinters:i:0;redirectsmartcards:i:0;redirectwebauthn:i:0;usbdevicestoredirect:s:;use multimon:i:0;screen mode id:i:1;smart sizing:i:1;autoreconnection enabled:i:1;bandwidthautodetect:i:1;networkautodetect:i:1;compression:i:1;encode redirected video capture:i:1;redirected video capture encoding quality:i:2;enablerdsaadauth:i:1;dynamic resolution:i:1;" -> "quality:i:1;capture:i:1;audiomode:i:0;videoplaybackmode:i:1;audiocapturemode:i:1;enablecredsspsupport:i:1;camerastoredirect:s:*;devicestoredirect:s:;drivestoredirect:s:;redirectclipboard:i:0;redirectcomports:i:0;redirectlocation:i:0;redirectprinters:i:0;redirectsmartcards:i:0;redirectwebauthn:i:0;usbdevicestoredirect:s:;use multimon:i:0;screen mode id:i:1;smart sizing:i:0;dynamic resolution:i:1;autoreconnection enabled:i:1;bandwidthautodetect:i:1;networkautodetect:i:1;compression:i:1;encode redirected video capture:i:1;redirected video capture encoding quality:i:2;enablerdsaadauth:i:1"
      ~ id                               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01" -> (known after apply)
        name                             = "hstpl-avd-vm100-usgovva-p01-pr01"
      ~ personal_desktop_assignment_type = "Direct" -> "Automatic" # forces replacement
      - tags                             = {} -> null
        # (11 unchanged attributes hidden)
    }

  # module.Hostpool.azurerm_virtual_desktop_host_pool.hostpool["va-avd-hp-prod-2"] will be created
  + resource "azurerm_virtual_desktop_host_pool" "hostpool" {
      + custom_rdp_properties            = "quality:i:1;capture:i:1;audiocapturemode:i:1;audiomode:i:0;videoplaybackmode:i:1;enablecredsspsupport:i:1;camerastoredirect:s:*;devicestoredirect:s:;drivestoredirect:s:;redirectclipboard:i:0;redirectcomports:i:0;redirectlocation:i:0;redirectprinters:i:0;redirectsmartcards:i:0;redirectwebauthn:i:0;usbdevicestoredirect:s:;use multimon:i:0;screen mode id:i:1;smart sizing:i:1;autoreconnection enabled:i:1;bandwidthautodetect:i:1;networkautodetect:i:1;compression:i:1;encode redirected video capture:i:1;redirected video capture encoding quality:i:2;enablerdsaadauth:i:1;dynamic resolution:i:1"
      + description                      = "AVD Host Pool for US Gov VA Prod P01 environment"
      + friendly_name                    = "AVD Host Pool - US Gov VA Prod P01"
      + id                               = (known after apply)
      + load_balancer_type               = "Persistent"
      + location                         = "usgovvirginia"
      + maximum_sessions_allowed         = 999999
      + name                             = "demo"
      + personal_desktop_assignment_type = "Automatic"
      + preferred_app_group_type         = "Desktop"
      + public_network_access            = "EnabledForClientsOnly"
      + resource_group_name              = "rg-avd-vm100-usgovva-p01"
      + start_vm_on_connect              = true
      + type                             = "Personal"
      + validate_environment             = false
    }

  # module.ScalingPlan.azapi_resource.scalingPlan["va-avd-sp-prod-1"] will be updated in-place
  ~ resource "azapi_resource" "scalingPlan" {
      ~ body                      = {
          ~ properties = {
              ~ hostPoolReferences = [
                  ~ {
                      ~ hostPoolArmPath    = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01" -> (known after apply)
                        # (1 unchanged attribute hidden)
                    },
                ]
                # (5 unchanged attributes hidden)
            }
        }
        id                        = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/scalingPlans/scplan-avd-vm100-usgovva-p01"
        name                      = "scplan-avd-vm100-usgovva-p01"
      ~ output                    = {
          - id         = "/subscriptions/***/resourcegroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/scalingplans/scplan-avd-vm100-usgovva-p01"
          - properties = {
              - hostPoolReferences = [
                  - {},
                ]
              - objectId           = "2e7e3d46-ac0a-41f2-b084-ef9dda69bb31"
            }
          - type       = "Microsoft.DesktopVirtualization/scalingplans"
        } -> (known after apply)
        tags                      = {}
        # (7 unchanged attributes hidden)
    }

  # module.SessionHost.azurerm_virtual_desktop_host_pool_registration_info.rg_token["va-avd-hp-prod-1"] will be created
  + resource "azurerm_virtual_desktop_host_pool_registration_info" "rg_token" {
      + expiration_date = (known after apply)
      + hostpool_id     = (known after apply)
      + id              = (known after apply)
      + token           = (sensitive value)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-1"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-1.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-1.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-2"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-2.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-2.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-1-3"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-3.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-3.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-11"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-11.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-11.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-13"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-13.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-13.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-18"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-18.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-18.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-4"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-4.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-4.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

  # module.SessionHostUnregister.azapi_resource_action.remove_session_host_from_hostpool["va-avd-sh-prod-2-5"] must be replaced
-/+ resource "azapi_resource_action" "remove_session_host_from_hostpool" {
      + exist            = (known after apply)
      ~ id               = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-5.FED.etnfederal.com" -> (known after apply)
      + output           = (known after apply)
      ~ resource_id      = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01/sessionHosts/EWAPV10001-5.FED.etnfederal.com" # forces replacement -> (known after apply) # forces replacement
      + sensitive_output = (sensitive value)
        # (4 unchanged attributes hidden)
    }

Plan: 13 to add, 1 to change, 10 to destroy.

Changes to Outputs:
  ~ hostpool_id        = {
      ~ va-avd-hp-prod-1 = "/subscriptions/***/resourceGroups/rg-avd-vm100-usgovva-p01/providers/Microsoft.DesktopVirtualization/hostPools/hstpl-avd-vm100-usgovva-p01-pr01" -> (known after apply)
      + va-avd-hp-prod-2 = (known after apply)
    }
terraform plan failed
At C:\actions-runner\_work\_temp\4d6a6103-eaa8-4e2a-b617-3db82f2191fe.ps1:6 char:3
+   throw "terraform plan failed"
+   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : OperationStopped: (terraform plan failed:String) [], RuntimeException
    + FullyQualifiedErrorId : terraform plan failed
 
Error: Process completed with exit code 1.
0s
1s
0s

