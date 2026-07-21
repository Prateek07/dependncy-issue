#tf.vars file for AVD environment in US Gov Virginia region
rgVariables = {
  va-avd-rg-prod-1 = {
    rgName     = "rg-avd-osimage-usgovva-p01"
    rgLocation = "usgovvirginia"
    rgTags = {
    }
  }
  va-avd-rg-prod-2 = {
    rgName     = "rg-avd-vm100-usgovva-p01"
    rgLocation = "usgovvirginia"
    rgTags = {
    }
  }
  va-avd-rg-prod-3 = {
    rgName     = "rg-avd-logs-usgovva-p01"
    rgLocation = "usgovvirginia"
    rgTags = {
    }
  }
  va-avd-rg-prod-4 = {
    rgName     = "rg-avd-automation-usgovva-p01"
    rgLocation = "usgovvirginia"
    rgTags = {
    }
  }
}
################################ subnetvariable ################################
snetVariables = {
  va-avd-snet-prod-1 = {
    vnetrg          = "rg-network-infra-prod"
    vnetname        = "vnet-avd-prod-usgovvirginia"
    snetName        = "snet-avd-hostpool-usgovva-p01"
    snetAddressPrefix = ["10.248.112.0/21"]
  }
  va-avd-snet-prod-2 = {
    vnetrg          = "rg-network-infra-prod"
    vnetname        = "vnet-avd-prod-usgovvirginia"
    snetName        = "snet-avd-osimagebuilder-usgovva-p01"
    snetAddressPrefix = ["10.248.120.48/28"]
  }
  va-avd-snet-prod-3 = {
    vnetrg            = "rg-network-infra-prod"
    vnetname          = "vnet-avd-prod-usgovvirginia"
    snetName          = "snet-avd-privateendpoints-usgovva-p01"
    snetAddressPrefix = ["10.248.120.0/27"]
  }
  va-avd-snet-prod-4 = {
    vnetrg            = "rg-network-infra-prod"
    vnetname          = "vnet-avd-prod-usgovvirginia"
    snetName          = "snet-avd-functionapp-usgovva-p01"
    snetAddressPrefix = ["10.248.120.64/27"]

    delegations = [
      {
        name = "delegation-functionapp"
        service_delegation = {
          name = "Microsoft.Web/serverFarms"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/action"
          ]
          
        }
      }
    ]
  }
}
################################ network security group variables ################################
nsgVariables = {
  va-avd-nsg-prod-1 = {
    name                = "nsg-avd-hostpool-usgovva-p01"
    resource_group_name = "rg-network-infra-prod"
    location            = "usgovvirginia"
    security_rules = []
  }
  va-avd-nsg-prod-2 = {
    name                = "nsg-avd-osimagebuilder-usgovva-p01"
    resource_group_name = "rg-network-infra-prod"
    location            = "usgovvirginia"
    security_rules = []
  }
  va-avd-nsg-prod-3 = {
    name                = "nsg-avd-privateendpoints-usgovva-p01"
    resource_group_name = "rg-network-infra-prod"
    location            = "usgovvirginia"
    security_rules = []
  }
  va-avd-nsg-prod-4 = {
    name                = "nsg-avd-functionapp-usgovva-p01"
    resource_group_name = "rg-network-infra-prod"
    location            = "usgovvirginia"
    security_rules = []
  }
}
################################ network security group subnet associations ################################
nsgSubnetAssociations = {
  va-avd-nsgassoc-prod-1 = {
    nsg_key    = "va-avd-nsg-prod-1"
    subnet_key = "va-avd-snet-prod-1"
  }
  va-avd-nsgassoc-prod-2 = {
    nsg_key    = "va-avd-nsg-prod-2"
    subnet_key = "va-avd-snet-prod-2"
  }
  va-avd-nsgassoc-prod-3 = {
    nsg_key    = "va-avd-nsg-prod-3"
    subnet_key = "va-avd-snet-prod-3"
  }
  va-avd-nsgassoc-prod-4 = {
    nsg_key    = "va-avd-nsg-prod-4"
    subnet_key = "va-avd-snet-prod-4"
  }
}
################################ Azure Compute gallery variables ################################
acgVariables = {
  va-avd-acg-prod-1 = {
    name                = "ig_avd_osimage_usgovva_p01"
    resource_group_name = "rg-avd-osimage-usgovva-p01"
    location            = "usgovvirginia"
    description         = "Shared image gallery for AVD images - prod"
  }
}
################################ Image Definition Variables ################################
imageDefinitionVariables = {
  va-avd-imagedef-prod-1 = {
    resource_group_name = "rg-avd-osimage-usgovva-p01"
    location            = "usgovvirginia"
    gallery_key = "va-avd-acg-prod-1"
    name = "idf-avd-osimage-w11ss-25h2-usgovva-p01"
    os_type = "Windows"
    trusted_launch_supported = true
    publisher = "MicrosoftWindows"
    offer     = "Windows-11-Enterprise"
    sku       = "2025-H2"
    hyper_v_generation  = "V2"
    accelerated_network_support_enabled = true
  }

  va-avd-imagedef-prod-2 = {
    resource_group_name = "rg-avd-osimage-usgovva-p01"
    location            = "usgovvirginia"
    gallery_key = "va-avd-acg-prod-1"
    name = "idf-avd-win11-25h2-nvadsa10-usgovva-p01"
    os_type = "Windows"
    trusted_launch_enabled = true
    publisher = "MicrosoftWindows"
    offer     = "Win-11-25h2"
    sku       = "nvadsa10"
    hyper_v_generation  = "V2"
    accelerated_network_support_enabled = true
  }

  va-avd-imagedef-prod-3 = {
    resource_group_name = "rg-avd-osimage-usgovva-p01"
    location            = "usgovvirginia"
    gallery_key = "va-avd-acg-prod-1"
    name = "idf-avd-win11-25h2-ncast4-usgovva-p01"
    os_type = "Windows"
    trusted_launch_enabled = true
    publisher = "MicrosoftWindows"
    offer     = "Win-11-25h2"
    sku       = "ncast4"
    hyper_v_generation  = "V2"
    accelerated_network_support_enabled = true
  }
}
################################ Image Version Data Variables ################################
imageVersionDataVariables = {
  va_avd_img_ver_prod_1 = {
    resource_group_name = "rg-avd-osimage-usgovva-p01"
    gallery_name        = "ig_avd_osimage_usgovva_p01"
    image_name  = "idf-avd-osimage-w11ss-25h2-usgovva-p01"
    version     = "1.0.0"
  }
  # va-avd-img-ver-prod-2 = {
  #   gallery_key = "va-avd-acg-prod-1"
  #   rg_key      = "va-avd-rg-prod-1"
  #   image_name  = "idf-avd-win11-25h2-nvadsa10-usgovva-p01"
  #   version     = "1.0.0"
  # }
}
################################ Workspace Variables ################################
workspaceVariables = {
  va-avd-ws-prod-1 = {
    name                = "wk-avd-vm100-usgovva-p01-pr01"
    resource_group_name = "rg-avd-vm100-usgovva-p01"
    location            = "usgovvirginia"
    friendly_name       = "AVD Workspace - US Gov VA Prod P01"
    description         = "AVD Workspace for US Gov VA Prod P01 environment"
    public_network_access_enabled = true
    log_analytics_workspace_key = "va-avd-law-prod-1"
  }
}
################################ Host Pool Variables ################################
hostPoolVariables = {
  va-avd-hp-prod-1 = {
    name                = "hstpl-avd-vm100-usgovva-p01-pr01"
    resource_group_name = "rg-avd-vm100-usgovva-p01"
    location            = "usgovvirginia"
    type               = "Personal"
    load_balancer_type = "Persistent"
    friendly_name      = "AVD Host Pool - US Gov VA Prod P01"
    description        = "AVD Host Pool for US Gov VA Prod P01 environment"
    preferred_app_group_type = "Desktop"
    personal_desktop_assignment_type = "Direct"
    start_vm_on_connect      = true
    validate_environment  = false
    custom_rdp_properties = "quality:i:1;capture:i:1;audiocapturemode:i:1;audiomode:i:0;videoplaybackmode:i:1;enablecredsspsupport:i:1;camerastoredirect:s:*;devicestoredirect:s:;drivestoredirect:s:;redirectclipboard:i:0;redirectcomports:i:0;redirectlocation:i:0;redirectprinters:i:0;redirectsmartcards:i:0;redirectwebauthn:i:0;usbdevicestoredirect:s:;use multimon:i:0;screen mode id:i:1;smart sizing:i:1;autoreconnection enabled:i:1;bandwidthautodetect:i:1;networkautodetect:i:1;compression:i:1;encode redirected video capture:i:1;redirected video capture encoding quality:i:2;enablerdsaadauth:i:1;dynamic resolution:i:1"
    public_network_access = "EnabledForClientsOnly"
    log_analytics_workspace_key = "va-avd-law-prod-1"
  }
  
 }
################################ Private Endpoint Variables ################################
privateEndpointVariables = {
  va-avd-pe-hp-prod-1 = {
    name                = "pe-avd-hstpl-vm100-usgovva-p01-pr01"
    resource_group_name = "rg-avd-vm100-usgovva-p01"
    location            = "usgovvirginia"
    subnet_key          = "va-avd-snet-prod-3"
    subresource_names   = ["connection"]
    target_type         = "hostpool"
    target_key          = "va-avd-hp-prod-1"
  }
  va-avd-pe-kv-prod-1 = {
    name                = "pe-avd-kv-usgovva-p01"
    resource_group_name = "rg-avd-vm100-usgovva-p01"
    location            = "usgovvirginia"
    subnet_key          = "va-avd-snet-prod-3"
    subresource_names   = ["vault"]
    target_type         = "keyvault"
    target_key          = "va-avd-kv-prod-1"
  }
  va-avd-pe-blob-prod-1 = {
    name                = "pe-avd-stblob-automation-usgovva-p01"
    resource_group_name = "rg-avd-automation-usgovva-p01"
    location            = "usgovvirginia"
    subnet_key          = "va-avd-snet-prod-3"
    subresource_names   = ["blob"]
    target_type         = "storageaccount"
    target_key          = "va-avd-sa-prod-1"
  }
  va-avd-pe-file-prod-1 = {
    name                = "pe-avd-stfile-automation-usgovva-p01"
    resource_group_name = "rg-avd-automation-usgovva-p01"
    location            = "usgovvirginia"
    subnet_key          = "va-avd-snet-prod-3"
    subresource_names   = ["file"]
    target_type         = "storageaccount"
    target_key          = "va-avd-sa-prod-1"
  }
  va-avd-pe-sbm-prod-1 = {
    name                = "pe-avd-sbm-automation-usgovva-p01"
    resource_group_name = "rg-avd-automation-usgovva-p01"
    location            = "usgovvirginia"
    subnet_key          = "va-avd-snet-prod-3"
    subresource_names   = ["namespace"]
    target_type         = "servicebusnamespace"
    target_key          = "va-avd-sbm-prod-1"
  }
}
################################ Session Host Variables ################################
sessionHostVariables = {
  va-avd-sh-prod-1 = {
    hostpool_key         = "va-avd-hp-prod-1"
    prefix               = "EWV0110001"
    start_index          = 1
    session_host_count   = 4
    deleted_hosts        = ["3","1","2"]    
    resource_group_name  = "rg-avd-vm100-usgovva-p01"
    location             = "usgovvirginia"
    subnet_key           = "va-avd-snet-prod-1"
    vm_size              = "Standard_D4s_v5"
    admin_username       = "etn-avd-sessionhost-uname"
    admin_password       = "etn-avd-sessionhost-pass"
    domain_join_username = "etn-avd-domainjoin-uname"
    domain_join_password = "etn-avd-domainjoin-pass"
    domain_name          = "FED.etnfederal.com"
    key_vault_key        = "va-avd-kv-prod-1"
    ou_path              = "OU=Computers,OU=Enterprise Clients-AVDI,DC=FED,DC=etnfederal,DC=com"
    gallery_image_version_key = "va_avd_img_ver_prod_1"
    disk_size_gb              = 1024
    enable_nvidia_gpu_driver = false

    tags = {
      az_res_costcenter = ""
    }
  }
  va-avd-sh-prod-2 = {
    hostpool_key         = "va-avd-hp-prod-1"
    prefix               = "demo-dce"
    start_index          = 1
    session_host_count   = 1
    deleted_hosts        = []   
    resource_group_name  = "rg-avd-vm100-usgovva-p01"
    location             = "usgovvirginia"
    subnet_key           = "va-avd-snet-prod-1"
    vm_size              = "Standard_D4s_v5"
    admin_username       = "etn-avd-sessionhost-uname"
    admin_password       = "etn-avd-sessionhost-pass"
    domain_join_username = "etn-avd-domainjoin-uname"
    domain_join_password = "etn-avd-domainjoin-pass"
    domain_name          = "FED.etnfederal.com"
    key_vault_key        = "va-avd-kv-prod-1"
    ou_path              = "OU=Computers,OU=Enterprise Clients-AVDI,DC=FED,DC=etnfederal,DC=com"
    gallery_image_version_key = "va_avd_img_ver_prod_1"
    disk_size_gb              = 1024
    enable_nvidia_gpu_driver = false

    tags = {
      az_res_costcenter = ""
    }
  }
  
}
################################ Application Group Variables ################################
applicationGroupVariables = {
  va-avd-ag-prod-1 = {
    name                         = "app-avd-vm100-usgovva-p01-pr01"
    resource_group_name          = "rg-avd-vm100-usgovva-p01"
    location                     = "usgovvirginia"
    hostpool_key                 = "va-avd-hp-prod-1"
    type                         = "Desktop"
    friendly_name                = "AVD Desktop App Group - US Gov VA Prod P01"
    description                  = "Desktop application group for the host pool"
    default_desktop_display_name = "Desktop"
    
  }
}
################################ Workspace Association Variables ################################
workspaceAssociationVariables = {
  va-avd-wsassoc-prod-1 = {
    workspace_key         = "va-avd-ws-prod-1"
    application_group_key = "va-avd-ag-prod-1"
  }
}
################################ Key Vault Variables ################################
keyVaultVariables = {
  va-avd-kv-prod-1 = {
    name                          = "kv-avd-usgovva-p01"
    resource_group_name           = "rg-avd-vm100-usgovva-p01"
    location                      = "usgovvirginia"
    sku_name                      = "standard"
    rbac_authorization_enabled     = true
    purge_protection_enabled      = true
    soft_delete_retention_days    = 90
    public_network_access_enabled = false
    log_analytics_workspace_key = "va-avd-law-prod-1"
  }
  
}
################################ Log Analytics Workspace Variables ################################
logAnalyticsWorkspaceVariables = {
  va-avd-law-prod-1 = {
    name                          = "law-avd-efe-usgovva-p01"
    resource_group_name           = "rg-avd-logs-usgovva-p01"
    location                      = "usgovvirginia"
    sku                           = "PerGB2018"
    retention_in_days             = 30
    daily_quota_gb                = 10
    internet_ingestion_enabled    = true
    internet_query_enabled        = true
    local_authentication_enabled = true
  }
}
################################ Scaling Plan Variables ################################
scalingPlanVariables = {
  va-avd-sp-prod-1 = {
    name               = "scplan-avd-vm100-usgovva-p01"
    resource_group_key = "va-avd-rg-prod-2"
    location           = "usgovvirginia"
    time_zone          = "Eastern Standard Time"
    hostpool_key       = "va-avd-hp-prod-1"
    friendly_name = "AVD Personal Scaling Plan"
    description   = "Scaling plan for personal host pool"
    exclusion_tag = "eatongov-avdi-excludeFromScaling"
    enabled       = false
    hostPoolType   = "Personal"
    personal_schedules = [
      {
        name         = "Weekdays"
        days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
 
        ramp_up_start_time                    = "06:00"
        ramp_up_auto_start_hosts              = "None"
        ramp_up_start_vm_on_connect           = "Enable"
        ramp_up_action_on_disconnect          = "Deallocate"
        ramp_up_minutes_to_wait_on_disconnect = 90
        ramp_up_action_on_logoff              = "Deallocate"
        ramp_up_minutes_to_wait_on_logoff     = 15

        peak_start_time                    = "08:00"
        peak_start_vm_on_connect           = "Enable"
        peak_action_on_disconnect          = "Deallocate"
        peak_minutes_to_wait_on_disconnect = 90
        peak_action_on_logoff              = "Deallocate"
        peak_minutes_to_wait_on_logoff     = 15

        ramp_down_start_time                    = "18:00"
        ramp_down_start_vm_on_connect           = "Enable"
        ramp_down_action_on_disconnect          = "Deallocate"
        ramp_down_minutes_to_wait_on_disconnect = 90
        ramp_down_action_on_logoff              = "Deallocate"
        ramp_down_minutes_to_wait_on_logoff     = 15

        off_peak_start_time                    = "20:00"
        off_peak_start_vm_on_connect           = "Enable"
        off_peak_action_on_disconnect          = "Deallocate"
        off_peak_minutes_to_wait_on_disconnect = 90
        off_peak_action_on_logoff              = "Deallocate"
        off_peak_minutes_to_wait_on_logoff     = 15
      }
    ]
    # tags = {}
  }
}
################################ Data Collection Endpoint Variables ##################
dceVariables = {
  va-avd-dce-prod-1 = {
    name                          = "dce-avd-vm100-usgovva-p01"
    resource_group_name           = "rg-avd-logs-usgovva-p01"
    location                      = "usgovvirginia"
    kind                          = "Windows"
    description                   = "Data collection endpoint for AVD session hosts"
    public_network_access_enabled = true
  }
}
################################ Data Collection Rule Variables ##################
dcrVariables = {
  va-avd-dcr-prod-1 = {
    name                        = "dcr-avd-vm100-usgovva-p01"
    resource_group_name         = "rg-avd-logs-usgovva-p01"
    location                    = "usgovvirginia"
    kind                        = "Windows"
    description                 = "Single DCR for all AVD session hosts"
    destination_name            = "law-destination"
    log_analytics_workspace_key = "va-avd-law-prod-1"
    association_description     = "Associate shared DCR to AVD session hosts"
    data_collection_endpoint_key = "va-avd-dce-prod-1"
    data_flows = [
      {
        streams      = ["Microsoft-Perf"]
        destinations = ["law-destination"]
      },
      {
          streams      = ["Microsoft-Event"]
          destinations = ["law-destination"]
      }
    ]
    performance_counters = [
      {
        name                          = "perf-counter-datasource"
        streams                       = ["Microsoft-Perf"]
        sampling_frequency_in_seconds = 60
        counter_specifiers = [
          "\\Processor Information(_Total)\\% Processor Time",
          "\\Memory\\Available Bytes",
          "\\Memory\\% Committed Bytes In Use",
          "\\LogicalDisk(_Total)\\% Free Space",
          "\\LogicalDisk(_Total)\\Avg. Disk sec/Transfer",
          "\\Network Interface(*)\\Bytes Total/sec"
        ]
      }
    ]

    windows_event_logs = [
      {
        name    = "windows-event-datasource"
        streams = ["Microsoft-Event"]
        x_path_queries = [
          "Application!*[System[(Level=1 or Level=2 or Level=3)]]"
          # "System!*[System[(Level=1 or Level=2 or Level=3)]]"
        ]
      }
    ]
  }
}
################################ Alert Variables ################################
alertVariables = {
  va-avd-alert-memory-prod-1 = {
    name                 = "alert-avd-memory-usgovva-p01"
    resource_group_name  = "rg-avd-logs-usgovva-p01"
    location             = "usgovvirginia"
    log_analytics_workspace_key  = "va-avd-law-prod-1"
    description          = "Memory > 90% on AVD session hosts"
    severity             = 2
    evaluation_frequency = "PT5M"
    window_duration      = "PT15M"
    action_group_keys   = ["va-avd-actiongroup-prod-1"]
    criteria = {
        query = <<-QUERY
        Perf
        | where ObjectName == "Memory"
        | where CounterName == "% Committed Bytes In Use"
        | summarize MetricValue = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
        QUERY
      time_aggregation_method = "Average"
      threshold               = 90
      operator                = "GreaterThan"
      metric_measure_column   = "MetricValue"
      failing_periods = {
        minimum_failing_periods_to_trigger_alert = 3
        number_of_evaluation_periods             = 3
      }
    }
  }
  va-avd-alert-cpu-prod-1 = {
    name                 = "alert-avd-cpu-usgovva-p01"
    resource_group_name  = "rg-avd-logs-usgovva-p01"
    location             = "usgovvirginia"
    log_analytics_workspace_key  = "va-avd-law-prod-1"
    description          = "CPU > 85% for 15 minutes on AVD session hosts"
    severity             = 2
    evaluation_frequency = "PT5M"
    window_duration      = "PT15M"
    action_group_keys   = ["va-avd-actiongroup-prod-1"]
    criteria = {
      query = <<-QUERY
        Perf
        | where ObjectName == "Processor Information"
        | where CounterName == "% Processor Time"
        | where InstanceName == "_Total"
        | summarize MetricValue = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
        QUERY
      time_aggregation_method = "Average"
      threshold               = 85
      operator                = "GreaterThan"
      metric_measure_column   = "MetricValue"
      failing_periods = {
        minimum_failing_periods_to_trigger_alert = 3
        number_of_evaluation_periods             = 3
      }
    }
  }
  va-avd-alert-diskfree-prod-1 = {
    name                 = "alert-avd-diskfree-usgovva-p01"
    resource_group_name  = "rg-avd-logs-usgovva-p01"
    location             = "usgovvirginia"
    log_analytics_workspace_key  = "va-avd-law-prod-1"
    description          = "Disk free space < 10% on AVD session hosts"
    severity             = 2
    evaluation_frequency = "PT5M"
    window_duration      = "PT15M"
     action_group_keys   = ["va-avd-actiongroup-prod-1"]
    criteria = {
      query = <<-QUERY
      Perf
      | where ObjectName == "LogicalDisk"
      | where CounterName == "% Free Space"
      | where InstanceName == "_Total"
      | summarize MetricValue = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
      QUERY
      time_aggregation_method = "Average"
      threshold               = 10
      operator                = "LessThan"
      metric_measure_column   = "MetricValue"
      failing_periods = {
        minimum_failing_periods_to_trigger_alert = 3
        number_of_evaluation_periods             = 3
      }
    }
  }
  va-avd-alert-disklatency-prod-1 = {
    name                 = "alert-avd-disklatency-usgovva-p01"
    resource_group_name  = "rg-avd-logs-usgovva-p01"
    location             = "usgovvirginia"
    log_analytics_workspace_key  = "va-avd-law-prod-1"
    description          = "Disk latency > 20 ms on AVD session hosts"
    severity             = 2
    evaluation_frequency = "PT5M"
    window_duration      = "PT15M"
    action_group_keys   = ["va-avd-actiongroup-prod-1"]
    criteria = {
      query = <<-QUERY
      Perf
      | where ObjectName == "LogicalDisk"
      | where CounterName == "Avg. Disk sec/Transfer"
      | where InstanceName == "_Total"
      | summarize MetricValue = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
      QUERY
      time_aggregation_method = "Average"
      threshold               = 0.02
      operator                = "GreaterThan"
      metric_measure_column   = "MetricValue"
      failing_periods = {
        minimum_failing_periods_to_trigger_alert = 3
        number_of_evaluation_periods             = 3
      }
    }
  }
  va-avd-alert-network-prod-1 = {
    name                 = "alert-avd-network-usgovva-p01"
    resource_group_name  = "rg-avd-logs-usgovva-p01"
    location             = "usgovvirginia"
    log_analytics_workspace_key  = "va-avd-law-prod-1"
    description          = "Network throughput > 50 MB/s on AVD session hosts"
    severity             = 3
    evaluation_frequency = "PT5M"
    window_duration      = "PT15M"
    action_group_keys   = ["va-avd-actiongroup-prod-1"]
    criteria = {
      query = <<-QUERY
        Perf
        | where ObjectName == "Network Interface"
        | where CounterName == "Bytes Total/sec"
        | summarize MetricValue = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
        QUERY
      time_aggregation_method = "Average"
      threshold               = 52428800
      operator                = "GreaterThan"
      metric_measure_column   = "MetricValue"
      failing_periods = {
        minimum_failing_periods_to_trigger_alert = 3
        number_of_evaluation_periods             = 3
      }
    }
  }
}
################################ Action Group Variables ################################
actionGroupVariables = {
  "va-avd-actiongroup-prod-1" = {
    name                = "ag-avd-vm100-usgovva-p01"
    resource_group_name = "rg-avd-logs-usgovva-p01"  
    short_name          = "agavdvap01"
    enabled             = true
    email_receivers = [
      {
        name                    = "List-Enterprise-IT-ECT"
        email_address           = "List-Enterprise-IT-ECT@Eaton.com"
      }
    ]
  }
}
################################ Application Group Assignment Variables ################################
application_group_assignments = { 
  "va-avd-group-assignment-1" = {
    application_group_key = "va-avd-ag-prod-1"
    principal_id    = "1ae9da66-9fef-4198-8cd1-cfc782d1dba9"  // Principal id of group(iga-app-vmlic-avdi-usva-p01-pr01)
    role_definition_name = "Desktop Virtualization User"

  }
}
################################ Service Health Alert Variables ################################
serviceHealthAlertVariables = {
  "va-avd-service-health-prod-1" = {
    name                = "alert-avd-servicehealth-usgovva-p01"
    resource_group_name = "rg-avd-logs-usgovva-p01"
    description         = "Service Health alert for Virtual Desktop service issues"
    enabled             = true
    # Optional scope override. If omitted, the module uses the current subscription from main.tf.
    # scopes = ["/subscriptions/<subscription-id>"]
    action_group_keys = ["va-avd-actiongroup-prod-1"]
    service_health = {
      events   = ["Incident" 
      # , "Planned Maintenance", "Security Advisory", "Health Advisory"
      ]
      services = ["Windows Virtual Desktop"]
      locations = ["usgovvirginia"]
    }
  }
}

# Vm Lifecycle Automation Managed Identity variables for AVD environment
# This managed identity will be used by the Azure Function App to perform cleanup of AVD session hosts in the environment.
mIdentity = {
  va-avd-mi-prod-1 = {
    miName          = "uami-avd-automation-usgovva-p01"
    miResourceGroup = "rg-avd-automation-usgovva-p01"
    miLocation      = "usgovvirginia"
    tags            = {}
  }
}
################################ Application Insights Variables ################################
applicationInsightsVariables = {
  va-avd-appi-prod-1 = {
    name                        = "appi-avd-automation-usgovva-p01"
    resource_group_name         = "rg-avd-automation-usgovva-p01"
    location                    = "usgovvirginia"
    application_type            = "web"
    log_analytics_workspace_key = "va-avd-law-prod-1"
    tags                        = {}
  }
}
################################ Storage Account Variables ############################
storageAccountVariables = {
  va-avd-sa-prod-1 = {
    name                            = "stavdfausgovvap01"
    resource_group_name             = "rg-avd-automation-usgovva-p01"
    location                        = "usgovvirginia"
    account_kind                    = "StorageV2"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    min_tls_version                 = "TLS1_2"
    https_traffic_only_enabled      = true
    allow_nested_items_to_be_public = false
    shared_access_key_enabled       = true
    public_network_access_enabled   = false
    tags                            = {}
  }
}
################################ Storage Container Variables ############################
storageContainerVariables = {
  va-avd-stc-prod-1 = {
    name                              = "avd-vmat-automation"
    storage_account_key               = "va-avd-sa-prod-1"
    container_access_type             = "private"
    metadata                          = {}
  }
}
################################ Service Bus Namespace Variables ############################
serviceBusNamespaceVariables = {
  va-avd-sbm-prod-1 = {
    name                          = "sbns-avd-automation-usgovva-p01"
    resource_group_name           = "rg-avd-automation-usgovva-p01"
    location                      = "usgovvirginia"
    sku                           = "Premium"
    capacity                      = 1
    minimum_tls_version           = "1.2"
    local_auth_enabled            = true
    public_network_access_enabled = false
    premium_messaging_partitions = 1
    tags                          = {}
  }
}
################################ Service Bus Queue Variables ############################
serviceBusQueueVariables = {
  va-avd-sbq-prod-1 = {
    name                                 = "sbq-avd-vmlc-automation-usgovva-p01"
    namespace_key                        = "va-avd-sbm-prod-1"
    max_delivery_count                   = 5
    default_message_ttl                  = "P14D"
    dead_lettering_on_message_expiration = true
  }
}
################################ Event Grid System Topic Variables ############################
eventGridSystemTopicVariables = {}
################################ Event Grid Subscription Variables ############################
eventGridSubscriptionVariables = {
  va-avd-egs-prod-1 = {
    name                  = "egs-avd-vmlc-automation-usgovva-p01"
    resource_group_name   = "rg-avd-automation-usgovaz-p01"
    system_topic          = "egst-avd-automation-usgovaz-p01"
    service_bus_queue_key = "va-avd-sbq-prod-1"
    delivery_identity_key = "va-avd-mi-prod-1"
    included_event_types  = ["Microsoft.ResourceNotifications.Resources.Deleted"]
    operation_names       = ["Microsoft.Compute/virtualMachines"]
    max_delivery_attempts = 10
    event_time_to_live    = 1440
    advanced_filter = {
      string_in = [
        {
          key   = "data.resourceInfo.type"
          values = ["Microsoft.Compute/virtualMachines"]
        }
      ]
    }  
  }
}

