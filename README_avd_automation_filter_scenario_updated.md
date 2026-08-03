# ecm-avdi-infrastructure-efe
 
> Azure Virtual Desktop (AVD) EFE landing zone deployed through Terraform in Azure Government.
 
---
 
## Document Purpose
 
This README explains what this repository deploys, why each major component is required, how changes are promoted, and how the client can validate the environment after deployment.
  
> Instead of manually creating Azure resources in the portal, the desired configuration is defined in code, reviewed through pull requests, and applied through an approved CI/CD pipeline.
 
 
---
 
## Quick Navigation
 
| Section | Use this when you want to understand |
|---|---|
| [Executive Summary](#1-executive-summary) | What this repository does and which environments it supports. |
| [What This Deployment Provides](#2-what-this-deployment-provides) | The business and platform capabilities delivered by Terraform. |
| [Simple Architecture Overview](#3-simple-architecture-overview) | How AVD components work together. |
| [Deployment Operating Model](#4-deployment-operating-model) | How changes move from pull request to deployment. |
| [Prerequisites Before Deployment](#7-prerequisites-before-deployment) | What must be ready before deployment. |
| [Common Client Change Requests](#12-common-client-change-requests) | How to add capacity, remove resources, or assign access. |
| [AVD Automation](#15-avd-automation) | How Event Grid, Service Bus, Function App, Managed Identity, App Service Plan, Storage, and Application Insights work together. |
| [Post-Deployment Validation Checklist](#16-post-deployment-validation-checklist) | How to confirm deployment success. |
| [Security Considerations](#18-security-considerations) | Security controls and review points. |
| [Troubleshooting Guide](#19-troubleshooting-guide) | Common deployment and operational issues. |
---
 
## Platform at a Glance
 
| Item | Summary |
|---|---|
| Platform | Azure Virtual Desktop EFE landing zone. |
| Cloud | Azure Government. |
| Deployment method | Terraform through CI/CD pipeline. |
| Environments | Arizona and Virginia. |
| Change control | Pull request, environment label, Terraform plan, approval, and apply. |
| Resource removal | Comment/remove the required `terraform.tfvars` values, review the plan, and apply through the approved pipeline. |
| Secrets | Stored in Azure Key Vault; values must not be committed to Git. |
| Monitoring | Azure Monitor, Log Analytics, DCR/DCE, Azure Monitor Agent, alerts, Service Health alerts, and Application Insights. |
| Automation | Event Grid, Service Bus, Windows Function App, App Service Plan, Storage Account, and managed identity support VM lifecycle and VM assignment/tagging automation. |
| User access | Existing Entra ID groups are assigned to AVD Application Groups. |
 
---
 
## 1. Executive Summary
 
This repository deploys and manages the Azure Virtual Desktop EFE landing zone for Azure Government environments.
 
The current repository design supports two separate environments:
 
| Environment | Terraform folder | Deployment label | Runner | Purpose |
|---|---|---|---|---|
| Arizona | `infra/envs/env-arizona` | `Arizona` | `efe-govaz-p01` | Deploys the Arizona AVD landing zone. |
| Virginia | `infra/envs/env-virginia` | `Virginia` | `efe-govva-p01` | Deploys the Virginia AVD landing zone. |
 
The deployment is organized using a layered Terraform model:
 
| Layer | Location | Simple explanation |
|---|---|---|
| Environment layer | `infra/envs/<environment>` | Defines what each environment should deploy. This is where Terraform is run. |
| Module layer | `infra/modules/<module>` | Reusable building blocks that create Azure resources such as host pools, Key Vaults, monitoring, networking, and session hosts. |
 
This approach provides:
 
- Controlled deployments through pull requests and pipeline approvals.
- Consistent infrastructure across Arizona and Virginia.
- Clear separation between environment-specific values and reusable resource logic.
- Improved auditability because infrastructure changes are tracked in Git.
- Safer resource removal through controlled `terraform.tfvars` changes, plan review, and approved pipeline apply.
 
---
 
## 2. What This Deployment Provides
 
At a high level, this repository deploys the Azure services needed for users to access a secure and monitored Azure Virtual Desktop environment.
 
| Capability | What it means for the client | Terraform modules involved |
|---|---|---|
| Resource organization | Azure resources are grouped logically by environment and workload. | `ResourceGroup` |
| AVD access experience | Users access desktops or applications through an AVD Workspace. | `Workspace`, `ApplicationGroup`, `WorkspaceAppGroupAssociation` |
| AVD compute capacity | Session host virtual machines provide the actual desktops users connect to. | `Hostpool`, `SessionHost`, `NetworkInterface` |
| User entitlement | Existing Entra ID groups are granted access to AVD Application Groups. | `ApplicationGroupAssignment` |
| Networking | Subnets, NSGs, NICs, and private endpoints place and protect the platform in the right network. | `Subnet`, `NetworkSecurityGroup`, `nsgSubnetAssociation`, `NetworkInterface`, `PrivateEndPoint` |
| Secrets and credentials | Sensitive deployment values are stored in Key Vault instead of being committed into Git. | `Keyvault`, Key Vault data lookups |
| Monitoring and diagnostics | Logs, metrics, agents, data collection rules, and service health alerts support operations. | `LogAnalyticsWorkspace`, `DiagnosticSetting`, `AzureMonitorAgent`, `DCR`, `DCE`, `Alerts`, `ActionGroup`, `ServiceHealthAlert` |
| Image management | Session hosts are created from approved image versions. | `ComputeGallery`, `ComputeGalleryDefinition`, `ComputeGalleryImageVersion` |
| Capacity management | AVD scaling plans help manage host pool capacity and cost. | `ScalingPlan` |
| Controlled cleanup | Resources are removed by changing desired state in `terraform.tfvars` and reviewing the plan. | Environment files, `SessionHostUnregister` |
| Event-driven automation | Azure resource and storage events are filtered, queued, and processed by PowerShell functions without embedding credentials in code. | `EventGridSystemTopic`, `EventGridSubscription`, `ServiceBusNamespace`, `ServiceBusQueue`, `WindowsFunctionApp`, `ManagedIdentity`, `AppServicePlan`, `ApplicationInsights`, `StorageAccount` |
 
---
 
## 3. Simple Architecture Overview
 
The diagram below shows the main flow in plain language.
 
```text
End user
   |
   v
Azure Virtual Desktop Workspace
   |
   v
Application Group
   |
   v
Host Pool
   |
   v
Session Host Virtual Machines
   |
   +--> Network Interface / Subnet / NSG
   +--> Key Vault for deployment-time credentials
   +--> Azure Monitor Agent / DCR / DCE / Log Analytics
   +--> Alerts and Service Health notifications

Azure resource or storage event
   |
   v
Event Grid System Topic and Event Subscription
   |
   v
Service Bus Queue
   |
   v
Windows Function App on App Service Plan
   |
   +--> User-assigned Managed Identity for passwordless access
   +--> Storage Account for function runtime/content and CSV processing
   +--> Application Insights for execution logs and troubleshooting
```
 
### How the AVD Components Work Together
 
| Component | Client-friendly explanation |
|---|---|
| AVD Workspace | The entry point users see when they open Azure Virtual Desktop. |
| Application Group | Defines what users can access, such as a desktop or remote application. |
| Host Pool | Groups the virtual machines that can host user sessions. |
| Session Host | The Windows virtual machine where the user session actually runs. |
| Network Interface | Connects each session host VM to the Azure network. |
| Subnet | Network segment where session hosts and related services are placed. |
| Network Security Group | Applies traffic rules to help control allowed network communication. |
| Key Vault | Securely stores credentials and secrets used during deployment. |
| Log Analytics Workspace | Central location where logs and monitoring data are sent. |
| DCR / DCE / Azure Monitor Agent | Defines and enables monitoring data collection from session hosts. |
| Alerts and Action Groups | Notifies operations teams when defined conditions occur. |
| Private Endpoint | Enables private connectivity to supported Azure services. |
| Application Group Assignment | Grants an existing Entra ID group access to an AVD Application Group. |
| Event Grid System Topic | Captures supported Azure resource or storage events from the configured source. |
| Event Grid Subscription | Filters required events and delivers matching events to a Service Bus Queue. |
| Service Bus Namespace and Queue | Buffers events, supports retries, and dead-letters messages that cannot be processed successfully. |
| Windows Function App | Runs the PowerShell automation that processes queued VM lifecycle and VM assignment/tagging events. |
| App Service Plan | Supplies the Windows hosting and compute capacity used by the Function App. |
| Managed Identity | Allows the automation to access Azure, Service Bus, Storage, and Microsoft Graph without storing credentials in code. |
| Application Insights | Stores Function App execution telemetry, traces, failures, and diagnostic information. |
 
---
 
## 4. Deployment Operating Model
 
This repository follows a controlled GitOps-style deployment model.
 
```text
Developer or engineer raises pull request
        |
        v
Reviewer validates Terraform changes
        |
        v
Environment label selects Arizona or Virginia pipeline
        |
        v
Pipeline runs init, formatting/linting, validate, and plan
        |
        v
Plan is reviewed for create, update, or remove actions
        |
        v
Approved change is merged or promoted
        |
        v
Pipeline applies the approved plan
        |
        v
Post-deployment validation confirms Azure resources
```
 
### CI/CD Pipeline Flow
 
| Stage | What happens | Why it matters |
|---|---|---|
| Pull request created | Infrastructure change is proposed in Git. | Ensures every change is reviewable. |
| Label applied | Label selects the target environment pipeline. | Prevents the wrong environment from being deployed. |
| Checkout and setup | Pipeline checks out code and prepares Terraform. | Creates a clean and repeatable deployment context. |
| Azure authentication | Pipeline authenticates using OIDC where possible. | Avoids storing long-lived secrets in CI/CD. |
| Terraform init | Backend and providers are initialized. | Ensures state and providers are ready. |
| Format / lint | Formatting and quality checks run, if configured. | Improves code quality and consistency. |
| Terraform validate | Terraform syntax and configuration are validated. | Catches issues before planning. |
| Terraform plan | Pipeline shows exactly what will change in Azure. | Primary review point before approval. |
| Approval | Authorized approver reviews and approves. | Adds governance for controlled environments. |
| Terraform apply | Approved plan is applied. | Creates, updates, or removes resources as planned. |
| Validation | Outputs and Azure resources are verified. | Confirms deployment success. |
 
### Environment Pipeline Mapping
 
| Pull request label | Environment | Expected workflow | Target path | Runner |
|---|---|---|---|---|
| `Arizona` | Arizona | `build-arizona.yml` | `infra/envs/env-arizona` | `efe-govaz-p01` |
| `Virginia` | Virginia | `build-virginia.yml` | `infra/envs/env-virginia` | `efe-govva-p01` |
 
---
 
## 5. Repository Structure
 
```text
ecm-avdi-infrastructure-efe/
|-- README.md
|-- function-code/
|   |-- host.json
|   |-- profile.ps1
|   |-- requirements.psd1
|   |-- avd-vminventory-capture/
|   |-- avd-vmassignment-tag/
|   `-- avd-vmlifecycle-delete/
|-- scripts/
|   |-- package-functionapp-code.py
|   `-- deploy-functionapp-code.sh
|-- workflows/
|   |-- pr-required-check.yml
|   |-- deploy-function.yml
|   |-- build-arizona.yml
|   |-- deploy-arizona.yml
|   |-- build-virginia.yml
|   `-- deploy-virginia.yml
`-- infra/
    |-- envs/
    |   |-- env-arizona/
    |   |   |-- backend.tf
    |   |   |-- data.tf
    |   |   |-- locals.tf
    |   |   |-- main.tf
    |   |   |-- output.tf
    |   |   |-- provider.tf
    |   |   |-- terraform.tfvars
    |   |   `-- variables.tf
    |   `-- env-virginia/
    |       |-- backend.tf
    |       |-- data.tf
    |       |-- locals.tf
    |       |-- main.tf
    |       |-- output.tf
    |       |-- provider.tf
    |       |-- terraform.tfvars
    |       `-- variables.tf
    `-- modules/
        |-- ActionGroup/
        |-- Alerts/
        |-- AppServicePlan/
        |-- ApplicationGroup/
        |-- ApplicationGroupAssignment/
        |-- ApplicationInsights/
        |-- AzureMonitorAgent/
        |-- ComputeGallery/
        |-- ComputeGalleryDefinition/
        |-- ComputeGalleryImageVersion/
        |-- DCE/
        |-- DCEAssociation/
        |-- DCR/
        |-- DCRAssociation/
        |-- DiagnosticSetting/
        |-- EventGridSubscription/
        |-- EventGridSystemTopic/
        |-- Hostpool/
        |-- Keyvault/
        |-- LogAnalyticsWorkspace/
        |-- ManagedIdentity/
        |-- NetworkInterface/
        |-- NetworkSecurityGroup/
        |-- NvidiaGpuExtension/
        |-- PrivateEndPoint/
        |-- ResourceGroup/
        |-- ScalingPlan/
        |-- ServiceBusNamespace/
        |-- ServiceBusQueue/
        |-- ServiceHealthAlert/
        |-- SessionHost/
        |-- SessionHostUnregister/
        |-- StorageAccount/
        |-- Subnet/
        |-- WindowsFunctionApp/
        |-- Workspace/
        |-- WorkspaceAppGroupAssociation/
        `-- nsgSubnetAssociation/
```
 
The `function-code` folder contains the PowerShell Azure Functions, the `scripts` folder packages and deploys Function code, and the `workflows` folder contains the pull-request, Terraform, and Function deployment pipelines.
 
### What Each Environment File Does
 
| File | Purpose |
|---|---|
| `provider.tf` | Defines Terraform version, Azure provider version, Azure Government target, and authentication approach. |
| `backend.tf` | Defines remote state backend. Remote state tracks what Terraform manages. |
| `variables.tf` | Defines what inputs are allowed and required. Think of this as the input contract. |
| `terraform.tfvars` | Provides the actual environment values. This is the main file used for environment-specific changes. |
| `data.tf` | Reads existing Azure resources or secrets, such as existing VNets or Key Vault secrets. |
| `locals.tf` | Translates readable inputs into the final values modules need, such as Azure resource IDs. |
| `main.tf` | Calls the modules and controls how resources are assembled. |
| `output.tf` | Exposes useful deployment information after apply, such as resource IDs and maps. |
 
---
 
## 6. Environment Configuration Summary
 
The exact values below should be completed from the final approved Terraform plan or environment-specific `terraform.tfvars` files.
 
| Item | Arizona | Virginia |
|---|---|---|
| Terraform path | `infra/envs/env-arizona` | `infra/envs/env-virginia` |
| Azure region | `usgovarizona` | `usgovvirginia` |
| Subscription | Azure Government Subscription | Azure Government Subscription |
| Backend state key | `avd-az.tfstate` | `avd-va.tfstate` |
| Resource groups | `rg-avd-osimage-usgovaz-p01`<br>`rg-avd-vm100-usgovaz-p01`<br>`rg-avd-logs-usgovaz-p01` | `rg-avd-osimage-usgovva-p01`<br>`rg-avd-vm100-usgovva-p01`<br>`rg-avd-logs-usgovva-p01` |
| AVD workspaces | `wk-avd-vm100-usgovaz-p01-pr01` | `wk-avd-vm100-usgovva-p01-pr01` |
| Host pools | `hstpl-avd-vm100-usgovaz-p01-pr01` | `hstpl-avd-vm100-usgovva-p01-pr01` |
| Session host | `EWAPA10001-1` | `EWAPV10001-1` |
| Key Vaults | `kv-avd-usgovaz-p01` | `kv-avd-usgovva-p01` |
| Log Analytics workspaces | `law-avd-efe-usgovaz-p01` | `law-avd-efe-usgovva-p01` |
| Compute Galleries | `ig_avd_osimage_usgovaz_p01` | `ig_avd_osimage_usgovva_p01` |
| Private endpoints | `pe-avd-hstpl-vm100-usgovaz-p01-pr01`|`pe-avd-hstpl-vm100-usgovva-p01-pr01` |
| Application Groups | `app-avd-vm100-usgovaz-p01-pr01` | `app-avd-vm100-usgovva-p01-pr01` |
| Scaling Plans | `scplan-avd-vm100-usgovaz-p01` | `scplan-avd-vm100-usgovva-p01` |
---
 
## 7. Prerequisites Before Deployment
 
Before a deployment is promoted, confirm the following items are ready.
 
| Area | Requirement | Owner |
|---|---|---|
| Azure subscription | Target Azure Government subscription is available. | Eaton Cloud Platform team |
| Azure permissions | CI/CD deployment identity has required Azure RBAC permissions. | Eaton IAM team |
| Existing VNet | Required VNet exists because this repo creates subnets inside an existing VNet. | Eaton Cloud Platform team |
| DNS and domain connectivity | Session hosts can reach required domain services if domain join is enabled. | Eaton Cloud Platform team |
| Key Vault | Required Key Vault exists or will be created as designed. | ECM team |
| Key Vault secrets | Required local admin and domain join secrets exist. | ECM team |
| Entra ID groups | Existing groups are available for AVD Application Group assignments. | ECM team  |
| Terraform backend | Azure Storage backend is available for remote state. | ECM team|
| GitHub runner | Environment-specific self-hosted runner is available. | ECM team |
| Approval process | Client or platform approver is defined. | ECM team |
 
---
 
## 8. Required Access and Permissions
 
The CI/CD identity must have enough access to create and manage the Azure resources defined by Terraform.
 
| Scope | Required capability | Notes |
|---|---|---|
| Azure subscription or target resource groups | Create, update, read, and remove Terraform-managed resources. | Exact role assignment should be confirmed with the security team. |
| Existing virtual network | Read VNet and create/update subnets if required. | VNet is looked up using data sources. |
| Networking | Create NICs, NSGs, NSG associations, and private endpoints. | Private DNS requirements should be confirmed. |
| Key Vault | Read required secrets during deployment. | Access should be limited to required secrets only. |
| AVD resources | Create workspaces, host pools, application groups, and associations. | Required for AVD platform deployment. |
| Monitoring | Create Log Analytics, DCR, DCE, diagnostic settings, alerts, and action groups. | Required for operations and alerting. |
| Entra ID group assignments | Assign existing groups to AVD Application Groups. | Group object IDs are supplied; groups are not created by this flow. |
| Terraform state backend | Read/write remote state. | State access must be tightly controlled. |
 
---
 
## 9. Terraform Backend and State Management
 
Terraform state records which Azure resources are managed by this repository. This repository uses an AzureRM remote backend, which means state is stored in Azure Storage instead of only on a local machine.
 
| Backend item | Arizona | Virginia |
|---|---|---|
| Backend type | `azurerm` | `azurerm`|
| Storage account | stavdtfusgovazp01 | stavdtfusgovvap01 |
| Container | tfstate | tfstate |
| Resource group | rg-avd-tfstate-usgovaz-p01 |rg-avd-tfstate-usgovva-p01 |
| State key  | avd.tfstate | avd.tfstate |
 
 
> [!IMPORTANT]
> Terraform state must be protected. Depending on provider behavior and resource configuration, state can include sensitive deployment metadata and sometimes sensitive values. Access to the state storage account should be limited to approved identities.
 
Example backend initialization pattern:
 
```bash
terraform init \
  -backend-config="resource_group_name=<state-resource-group>" \
  -backend-config="storage_account_name=<state-storage-account>" \
  -backend-config="container_name=<state-container>" \
  -backend-config="key=<environment-state-key>"
```
---
 
## 10. How to Read This Terraform Repository
 
For someone new to the repository, use this reading order:
 
| Step | File or folder | What to look for |
|---|---|---|
| 1 | `infra/envs/<env>/terraform.tfvars` | What this environment intends to deploy. |
| 2 | `infra/envs/<env>/variables.tf` | The required input structure and field names. |
| 3 | `infra/envs/<env>/locals.tf` | How readable keys are resolved into Azure IDs and module-ready values. |
| 4 | `infra/envs/<env>/main.tf` | Which modules are called and in what dependency order. |
| 5 | `infra/envs/<env>/output.tf` | What values are exposed after deployment. |
| 6 | `infra/modules/<module>` | How each Azure resource is implemented. |
 
Data flow:
 
```text
terraform.tfvars
  -> variables.tf validates expected structure
  -> locals.tf resolves keys and builds final objects
  -> main.tf passes values into modules
  -> modules create or update Azure resources
  -> output.tf exposes useful IDs and results
```
 
---
 
## 11. Main Input Categories
 
The actual environment values live in `terraform.tfvars`. The table below summarizes the major input groups used by the repository.
 
| Input category | Example variable group | Purpose |
|---|---|---|
| Resource groups | `rgVariables` | Defines Azure Resource Groups. |
| Subnets | `snetVariables` | Defines subnets inside existing VNets. |
| Network security | `nsgVariables`, `nsgSubnetAssociations` | Defines NSGs, rules, and subnet associations. |
| AVD workspace | `workspaceVariables` | Defines the AVD workspace. |
| Host pools | `hostPoolVariables` | Defines AVD host pools. |
| Application groups | `applicationGroupVariables` | Defines desktop or app publishing groups. |
| User assignments | `application_group_assignments` | Maps existing Entra ID groups to AVD Application Groups. |
| Session hosts | `sessionHostVariables` | Defines VM groups, count, size, subnet, image, host pool, and secrets. |
| Key Vault | `keyVaultVariables` | Defines Key Vault resources or references. |
| Monitoring | `logAnalyticsWorkspaceVariables`, `dcrVariables`, `dceVariables`, `diagnostic_settings` | Defines monitoring and data collection configuration. |
| Alerts | `actionGroupVariables`, `alertVariables`, `serviceHealthAlertVariables` | Defines alerts and notification behavior. |
| Private endpoints | `privateEndpointVariables` | Defines private connectivity. |
| Scaling | `scalingPlanVariables` | Defines AVD scaling plan behavior. |
 
---
 
## 12. UseCases for Hostpool
 
Host Pools are defined under `hostPoolVariables` and act as the logical container where Session Hosts register.

### 12.1 Add a New Host Pool
 
Typical request: "Create a new Host Pool for a new workload or business unit."
 
Recommended approach:
 
1. Add a new entry under `hostPoolVariables`.
2. Configure the host pool name, type, load balancer, and session limits.
3. Create or update a Session Host group and reference the new Host Pool using `hostpool_key`.
4. Raise a pull request.
5. Review the Terraform plan.
6. Apply through the approved pipeline.
7. Validate Host Pool creation and registration in Azure Portal.
 
Example:
 
```hcl
hostPoolVariables = {
  az-avd-hp-prod-1 = {
    name                     = "avd-prod-hp01"
    type                     = "Pooled"
    load_balancer_type       = "DepthFirst"
    maximum_sessions_allowed = 10
  }
 
  az-avd-hp-prod-2 = {
    name                     = "avd-prod-hp02"
    type                     = "Pooled"
    load_balancer_type       = "DepthFirst"
    maximum_sessions_allowed = 10
  }
}

```
> [!IMPORTANT]
> Creating a new Host Pool requires a dedicated Private Endpoint. After adding the Host Pool configuration, you must also add a new Private Endpoint entry with a unique key and associate it with the new Host Pool. Without this configuration, the Host Pool will not be accessible over the private network and private connectivity will not be established.

 
### 12.2 Update an Existing Host Pool
 
Common updates:
 
- Change load balancer type.
- Change maximum sessions allowed.
- Update friendly name or description.
- Enable or disable Start VM on Connect.
 
Example:
 
```hcl
maximum_sessions_allowed = 20
load_balancer_type       = "BreadthFirst"
```

## 13. UseCases for Session Host

### 13.1 Session Host Field Guide
 
| Field | Purpose |
|---|---|
| Logical key, for example `az-avd-sh-prod-1` | Unique Terraform key representing a session host group. |
| `hostpool_key` | References the AVD Host Pool where the session hosts register. |
| `prefix` | Prefix used when generating session host VM names. |
| `start_index` | Starting number used when generating VM names. Helps avoid naming conflicts and supports controlled expansion. |
| `session_host_count` | Number of session host VMs Terraform should create for this group. |
| `deleted_hosts` | List of session host names that should be excluded or removed while preserving numbering continuity. |
| `rg_key` | References the Resource Group where session hosts are deployed. |
| `subnet_key` | References the subnet where session host NICs are created. |
| `vm_size` | Azure VM SKU assigned to each session host. |
| `admin_username` | Key Vault secret name containing the local administrator username. |
| `admin_password` | Key Vault secret name containing the local administrator password. |
| `domain_name` | Active Directory domain used for domain join. |
| `domain_join_username` | Key Vault secret name containing the domain join account username. |
| `domain_join_password` | Key Vault secret name containing the domain join account password. |
| `key_vault_key` | References the Key Vault containing deployment secrets. |
| `ou_path` | Optional Active Directory Organizational Unit where computers are placed during domain join. |
| `gallery_image_version_key` | References the Azure Compute Gallery image version used for session host creation. |
| `source_image_reference` | Optional marketplace image definition used instead of a Compute Gallery image. |
| `os_disk_storage_account_type` | Storage type used for the OS disk (for example Premium SSD). |
| `disk_size_gb` | Size of the operating system disk in GB. |
| `enable_nvidia_gpu_driver` | Controls installation of the NVIDIA GPU extension when GPU-enabled VMs are used. |
| `vtpm_enabled` | Enables or disables virtual TPM for Trusted Launch scenarios. |
| `secure_boot_enabled` | Enables or disables Secure Boot for the VM. |
| `tags` | Metadata used for governance, ownership, environment, and cost allocation. |
 
---
 
### 13.2 Add a New Session Host In Existing Hostpool(Same key)
 
Typical request: "Add one more session host VM."
 
Change location:
 
```text
infra/envs/<env>/terraform.tfvars
```
 
Recommended approach:
 
1. Find the relevant session host group under `sessionHostVariables.session_hosts`.
2. Increase `session_host_count`.
3. Raise a pull request.
4. Review the Terraform plan.
5. Confirm only the expected VM, NIC, monitoring association, and registration changes are shown.
6. Apply through the approved pipeline.
 
Example:
 
```hcl
session_host_count = 2
```
 
Change to:
 
```hcl
session_host_count = 3
```
 
Terraform will create additional session host VM and its supporting resources.
Typical request: "Create a new set of session hosts with a existing host pool, image, subnet, or size."
 
Add a new logical entry under `sessionHostVariables.session_hosts`.
 
Example:
 
```hcl
sessionHostVariables = {
  az-avd-sh-prod-4 = {
    hostpool_key              = "az-avd-hp-prod-1"
    prefix                    = "EWAPA10001"
    start_index               = 1
    session_host_count        = 3
    deleted_hosts             = []
 
    rg_key                    = "az-avd-rg-prod-2"
    subnet_key                = "az-avd-snet-prod-1"
    vm_size                   = "Standard_NV24s_v3"
 
    admin_username            = "etn-avd-sessionhost-uname"
    admin_password            = "etn-avd-sessionhost-pass"
 
    domain_name               = "FED.etnfederal.com"
    domain_join_username      = "etn-avd-domainjoin-uname"
    domain_join_password      = "etn-avd-domainjoin-pass"
 
    key_vault_key             = "az-avd-kv-prod-1"
    ou_path                   = "OU=Computers,OU=Enterprise Clients-AVDI,DC=FED,DC=etnfederal,DC=com"
 
    gallery_image_version_key = "az-avd-img-ver-prod-1"
 
    disk_size_gb              = 512
    os_disk_storage_account_type = "Premium_LRS"
 
    enable_nvidia_gpu_driver  = false
    vtpm_enabled              = true
    secure_boot_enabled       = true
 
    tags = {
      az_res_costcenter = ""
    }
  }
}
 
```

### 13.3 Add a New Session Host in New Hostpool
 
Typical request: "Create a new set of session hosts with a different host pool, image, subnet, or size."
 
Add a new logical entry under `sessionHostVariables`.
 
Example:
 
```hcl
sessionHostVariables = {
  az-avd-sh-prod-5 = {
    hostpool_key              = "az-avd-hp-prod-2"
    prefix                    = "EWAPA10001"
    start_index               = 100
    session_host_count        = 2
    deleted_hosts             = []
 
    rg_key                    = "az-avd-rg-prod-2"
    subnet_key                = "az-avd-snet-prod-1"
    vm_size                   = "Standard_NV24s_v3"
 
    admin_username            = "etn-avd-sessionhost-uname"
    admin_password            = "etn-avd-sessionhost-pass"
 
    domain_name               = "FED.etnfederal.com"
    domain_join_username      = "etn-avd-domainjoin-uname"
    domain_join_password      = "etn-avd-domainjoin-pass"
 
    key_vault_key             = "az-avd-kv-prod-1"
    ou_path                   = "OU=Computers,OU=Enterprise Clients-AVDI,DC=FED,DC=etnfederal,DC=com"
 
    gallery_image_version_key = "az-avd-img-ver-prod-1"
 
    disk_size_gb              = 512
    os_disk_storage_account_type = "Premium_LRS"
 
    enable_nvidia_gpu_driver  = false
    vtpm_enabled              = true
    secure_boot_enabled       = true
 
    tags = {
      az_res_costcenter = ""
    }
  }
}
 
```
Before applying, confirm the referenced resource group, subnet, NSG, host pool, Key Vault, secrets, and image version exist or are created in the same environment.

### 13.4 Delete a Session Host
 
 Delete one session host VM.
 
Change location:
 
```text
infra/envs/<env>/terraform.tfvars
```
 
Recommended approach:
 
1. Find the relevant session host group under `sessionHostVariables`.
2. Add the session host number to `deleted_hosts`.
3. Keep `session_host_count` high enough to preserve the remaining desired host numbers.
4. Raise a pull request.
5. Review the Terraform plan.
6. Confirm only the expected VM, NIC, monitoring association, and host pool unregister changes are shown.
7. Apply through the approved pipeline.
8. Validate that the session host is removed from Azure and unregistered from the AVD host pool.
 
Example:
 
```hcl
session_host_count = 3
deleted_hosts      = []
```
 
Change to:
 
```hcl
session_host_count = 3
deleted_hosts      = ["2"]
```
 
Terraform will remove the session host whose generated index is `2`, while keeping the numbering for the remaining session hosts stable.
 
> [!NOTE]
> Use `deleted_hosts` when you need to remove a specific session host but keep later host numbers unchanged. Reduce `session_host_count` only when removing hosts from the end of the generated sequence.
 
### 13.5 Grant Users Access to AVD
 
This repository uses an existing Entra ID / Azure AD group and assigns it to an AVD Application Group.
 
The group is not created by Terraform in this flow. Terraform uses the existing group object ID as the principal for the role assignment.
 
High-level flow:
 
```text
Application Group is created
        ->
Application Group ID is output by Terraform
        ->
Existing Entra ID group object ID is provided in terraform.tfvars
        ->
ApplicationGroupAssignment module creates role assignment
        ->
Users in that group can access the assigned AVD desktop or application
```
 
Example:
 
```hcl
application_group_assignments = {
  va_avd_group_assignment_1 = {
    application_group_key   = "va-avd-ag-prod-1"
    azuread_group_object_id = "00000000-0000-0000-0000-000000000000"
  }
}
```
 
Do not place real production group object IDs in public examples unless approved.
 
---
 
## 14. How Secrets Are Used
 
This repository uses a deployment-time secret retrieval model for session hosts.
 
This means the session host VM does not directly call Key Vault at runtime to fetch these secrets. Terraform reads the required Key Vault secrets during deployment and passes the resolved values into VM creation and VM extensions.
 
```text
Secret names are defined in terraform.tfvars
        ->
data.tf locates the Key Vault
        ->
data.tf reads the required secrets
        ->
locals.tf builds the final session host configuration
        ->
SessionHost module creates VM and runs required extensions
```
 
Secrets commonly used by session hosts:
 
| Secret purpose | Used for |
|---|---|
| Local admin username | Windows VM creation. |
| Local admin password | Windows VM creation. |
| Domain join username | Domain join extension. |
| Domain join password | Domain join extension protected settings. |
 
> [!IMPORTANT]
> Because Terraform reads these values during deployment, access to CI/CD logs, Terraform plan output, and remote state must be protected. Secret values must never be committed to Git or documented in this README.
 
---
 
## 15. AVD Automation

The automation uses Event Grid to capture approved Azure events, Service Bus to queue them, and the Windows Function App to process them.

### 15.1 Automation Flow

Each function has its own trigger flow.

```text
VM Lifecycle Automation
VM is deleted
    -> Event Grid captures the VM deletion event
    -> Event Grid Subscription sends the event to the VM lifecycle Service Bus Queue
    -> avd-vmlifecycle-delete is triggered

VM Assignment and Tagging Automation
Approved CSV file is uploaded to the Storage Account
    -> Event Grid captures the Blob Created event
    -> Event Grid Subscription sends the event to the VM assignment Service Bus Queue
    -> avd-vmassignment-tag is triggered

Inventory Capture Automation
Timer runs every five minutes
    -> avd-vminventory-capture is triggered directly
```

| Automation | Trigger Flow | Function |
|---|---|---|
| VM lifecycle | VM deletion event -> Event Grid Subscription -> `sbq-avd-vmlc-automation-...` | `avd-vmlifecycle-delete` |
| VM assignment and tagging | Approved CSV blob upload -> Event Grid Subscription -> `sbq-avd-vmat-automation-...` | `avd-vmassignment-tag` |
| Inventory capture | Timer trigger every five minutes | `avd-vminventory-capture` |

### 15.2 Managed Identity

The user-assigned managed identity is attached to the Function App and is used by Event Grid for delivery to Service Bus.

```hcl
mIdentity = {
  az-avd-mi-prod-1 = {
    miName          = "uami-avd-automation-usgovaz-p01"
    miResourceGroup = "rg-avd-automation-usgovaz-p01"
    miLocation      = "usgovarizona"
    tags            = {}
  }
}
```

Assign only the required Azure RBAC and Microsoft Graph permissions.

### 15.3 Service Bus Namespace and Queue

Service Bus stores matching events until the Function App processes them. Separate queues are used for separate automation functions.

#### Scenario: Add a New Service Bus Queue

Add a unique entry under `serviceBusQueueVariables` in the regional `terraform.tfvars` file.

```hcl
serviceBusQueueVariables = {
  az-avd-sbq-prod-3 = {
    name                                 = "sbq-avd-new-automation-usgovaz-p01"
    namespace_key                        = "az-avd-sbm-prod-1"
    max_delivery_count                   = 5
    default_message_ttl                  = "P14D"
    dead_lettering_on_message_expiration = true
  }
}
```

Confirm that the queue is created in the expected namespace and has no unexpected dead-letter messages.

### 15.4 Event Grid System Topic and Subscription

The System Topic receives Azure events. The Event Grid Subscription filters the required event and sends it to the selected Service Bus Queue.

#### Scenario: Add a New Event Grid Subscription for the New Queue

After creating the queue, add a new entry under `eventGridSubscriptionVariables` and reference its queue key.

```hcl
eventGridSubscriptionVariables = {
  az-avd-egs-prod-3 = {
    name                  = "egs-avd-new-automation-usgovaz-p01"
    resource_group_name   = "rg-avd-automation-usgovaz-p01"
    system_topic          = "egst-avd-vmlc-automation-usgov-p01"
    service_bus_queue_key = "az-avd-sbq-prod-3"
    delivery_identity_key = "az-avd-mi-prod-1"
    included_event_types  = ["Microsoft.ResourceNotifications.Resources.Deleted"]
    max_delivery_attempts = 10
    event_time_to_live    = 1440

    advanced_filter = {
      string_in = [
        {
          key    = "data.resourceInfo.type"
          values = ["Microsoft.Compute/virtualMachines"]
        }
      ]
    }
  }
}
```

Validate one matching event and one non-matching event. Only the matching event should reach the queue.

#### Scenario: Add a New Filter to an Existing Event Grid Subscription

Update the existing subscription entry in the regional `terraform.tfvars` file. Add the new filter inside `advanced_filter` without removing the existing filter.

Example: allow VM deletion events only for the listed resource groups.

```hcl
advanced_filter = {
  string_in = [
    {
      key    = "data.resourceInfo.type"
      values = ["Microsoft.Compute/virtualMachines"]
    }
  ]

  string_begins_with = [
    {
      key = "data.resourceInfo.id"
      values = [
        "/subscriptions/<subscription-id>/resourceGroups/rg-avd-usgovaz-p01/",
        "/subscriptions/<subscription-id>/resourceGroups/rg-avd-usgovva-p01/"
      ]
    }
  ]
}
```

Run the Terraform plan and confirm that only the existing Event Grid Subscription is updated. Test one matching resource and one resource outside the configured filter.

### 15.5 Storage Account and Container

The Storage Account supports the Function runtime and CSV-based automation. The container must remain private.

```hcl
storageContainerVariables = {
  az-avd-stc-prod-1 = {
    name                  = "avd-vmat-automation"
    storage_account_key   = "az-avd-sa-prod-1"
    container_access_type = "private"
    metadata              = {}
  }
}
```

### 15.6 App Service Plan

The App Service Plan provides Windows compute capacity for the Function App.

```hcl
appServicePlanVariables = {
  az-avd-asp-prod-1 = {
    name                   = "asp-avd-automation-usgovaz-p01"
    resource_group_name    = "rg-avd-automation-usgovaz-p01"
    location               = "usgovarizona"
    os_type                = "Windows"
    sku_name               = "EP1"
    zone_balancing_enabled = false
    tags                   = {}
  }
}
```

### 15.7 Windows Function App

The Function App references the App Service Plan, Storage Account, managed identity, Service Bus, Application Insights, and VNet integration subnet by Terraform keys.

```hcl
windowsFunctionAppVariables = {
  az-avd-fa-prod-1 = {
    name                              = "func-avd-automation-usgovaz-p01"
    resource_group_name               = "rg-avd-automation-usgovaz-p01"
    location                          = "usgovarizona"
    app_service_plan_key              = "az-avd-asp-prod-1"
    storage_account_key               = "az-avd-sa-prod-1"
    managed_identity_key              = "az-avd-mi-prod-1"
    service_bus_namespace_key         = "az-avd-sbm-prod-1"
    service_bus_queue_key             = "az-avd-sbq-prod-1"
    application_insights_resource_key = "az-avd-appi-prod-1"
    subnet_key                        = "az-avd-snet-prod-4"

    powershell_core_version       = "7.6"
    functions_extension_version  = "~4"
    functions_worker_runtime     = "powershell"
    public_network_access_enabled = false
    vnet_route_all_enabled       = true
    tags                         = {}
  }
}
```

### 15.8 Private Endpoints

Private Endpoints provide private connectivity for the Function App, Storage Account, and Service Bus Namespace. Add each endpoint under `privateEndpointVariables` after the target resource key exists.

```hcl
privateEndpointVariables = {
  az-avd-pe-func-prod-1 = {
    name                = "pe-avd-func-automation-usgovaz-p01"
    resource_group_name = "rg-avd-automation-usgovaz-p01"
    location            = "usgovarizona"
    subnet_key          = "az-avd-snet-prod-3"
    subresource_names   = ["sites"]
    target_type         = "functionapp"
    target_key          = "az-avd-fa-prod-1"
  }

  az-avd-pe-sbm-prod-1 = {
    name                = "pe-avd-sbm-automation-usgovaz-p01"
    resource_group_name = "rg-avd-automation-usgovaz-p01"
    location            = "usgovarizona"
    subnet_key          = "az-avd-snet-prod-3"
    subresource_names   = ["namespace"]
    target_type         = "servicebusnamespace"
    target_key          = "az-avd-sbm-prod-1"
  }
}
```

Storage requires separate Private Endpoints for the required subresources, such as `blob` and `file`.

### 15.9 Application Insights

Application Insights records Function invocations, exceptions, dependencies, and execution traces.

```hcl
applicationInsightsVariables = {
  az-avd-appi-prod-1 = {
    name                        = "appi-avd-automation-usgovaz-p01"
    resource_group_name         = "rg-avd-automation-usgovaz-p01"
    location                    = "usgovarizona"
    application_type            = "web"
    log_analytics_workspace_key = "az-avd-law-prod-1"
    tags                        = {}
  }
}
```

### 15.10 Function Code and Deployment Files

| Path | Purpose |
|---|---|
| `function-code/<function-name>/function.json` | Defines the Function trigger and binding. |
| `function-code/<function-name>/run.ps1` | Contains the PowerShell logic. |
| `function-code/host.json` | Defines host timeout, logging, and extension bundle settings. |
| `function-code/requirements.psd1` | Defines PowerShell managed dependencies. |
| `scripts/package-functionapp-code.py` | Creates the deployment package. |
| `scripts/deploy-functionapp-code.sh` | Deploys the package to the selected Function App. |
| `workflows/deploy-function.yml` | Selects the region and runs the deployment. |

### 15.11 Automation Deployment Sequence

1. Managed Identity
2. Service Bus Namespace and Queues
3. Event Grid System Topics and Subscriptions
4. Storage Account and Container
5. App Service Plan
6. Windows Function App
7. Application Insights
8. Private Endpoints for Function App, Storage, and Service Bus
9. Azure RBAC and Microsoft Graph permissions
10. Function code deployment and controlled validation

> [!IMPORTANT]
> Review the Terraform plan before deployment. Confirm that Event Grid filters route only approved events and that the new subscription references the correct Service Bus Queue key.

---

## 16. Post-Deployment Validation Checklist
 
After deployment, validate the environment using the checklist below.
 
| Validation area | What to check | Expected result |
|---|---|---|
| Pipeline | Confirm the pipeline completed successfully. | No failed stages. |
| Terraform plan/apply | Review final apply result. | Only approved changes were applied. |
| Resource groups | Confirm expected resource groups exist. | Resource groups are present in the expected region. |
| AVD workspace | Check AVD Workspace. | Workspace exists and is visible. |
| Application groups | Check Application Groups. | Desktop or app groups are created and associated. |
| Host pools | Check host pools. | Host pools exist with expected settings. |
| Session hosts | Check VM and host pool registration status. | Session hosts are available and registered. |
| User access | Test with a user in the assigned Entra ID group. | User can see and access the assigned desktop/application. |
| Networking | Validate subnet, NSG, NIC, and private endpoint configuration. | Associations and network placement are correct. |
| Key Vault | Confirm required secrets exist and access is controlled. | Secrets are available to deployment identity only as required. |
| Monitoring | Confirm AMA, DCR, DCE, diagnostics, and Log Analytics. | Telemetry collection is configured. |
| Alerts | Confirm action groups and alert rules. | Notifications route to the correct support contacts. |
| Service Health | Confirm health alert configuration. | Alert rule exists for the expected service/region/scope. |
| Managed Identity | Confirm the Function App identity and required RBAC/Graph permissions. | Identity is attached and authorized for the approved operations. |
| Event Grid | Confirm system topics, subscriptions, event types, and advanced filters. | Only approved VM deletion and CSV blob events match. |
| Service Bus | Confirm both queues, active message count, retry settings, and dead-letter state. | Queues are healthy and no unexpected messages remain dead-lettered. |
| Function App | Confirm runtime, app settings, VNet integration, private access, and deployed functions. | Both functions are visible and their triggers are synchronized. |
| Storage automation | Confirm the private container and approved CSV/status blob paths. | Function identity can read/write required blobs over the private network. |
| Application Insights | Run a controlled test and review invocation logs. | One expected invocation completes with the correct success/failure result. |
| Outputs | Review Terraform outputs. | Required IDs and output maps are available. |
 
---
 
## 17. Monitoring and Operations
 
This repository configures Azure Monitor components to support operations and troubleshooting.
 
| Component | Purpose |
|---|---|
| Log Analytics Workspace | Central location for logs and telemetry. |
| Diagnostic Settings | Sends platform logs and metrics from supported Azure resources. |
| Azure Monitor Agent | Enables telemetry collection from session host VMs. |
| Data Collection Rule | Defines what monitoring data is collected. |
| Data Collection Endpoint | Provides a dedicated endpoint for data collection scenarios. |
| Action Group | Defines notification receivers for alerts. |
| Alerts | Detect conditions that need operational attention. |
| Service Health Alert | Notifies when Microsoft publishes relevant Azure service issues. |
 
---
 
## 18. Security Considerations
 
| Security topic | How it is handled or should be reviewed |
|---|---|
| CI/CD authentication | OIDC should be used where possible instead of long-lived credentials. |
| Secret storage | Secrets should be stored in Key Vault, not in Git. |
| Secret retrieval | Terraform reads required secrets during deployment for VM creation and extensions. |
| Terraform state | Remote state must be restricted because it may contain sensitive metadata or values. |
| Network controls | NSGs and private endpoints should be reviewed with the network/security team. |
| User access | Existing Entra ID groups are assigned intentionally to AVD Application Groups. |
| Least privilege | Deployment identity should have only the permissions required for deployment. |
| Logging | Pipeline and Terraform logs must not expose secrets. |
| Change control | Pull request, plan review, and approval should be mandatory for controlled environments. |
| Cost/governance tags | Tags should be reviewed for cost center, owner, environment, and compliance reporting. |
| Function App identity | Use the user-assigned managed identity instead of secrets or connection strings wherever supported. |
| Microsoft Graph permissions | Grant only the application permission required by the cleanup workflow and review admin consent separately. |
| Event filtering | Restrict Event Grid subscriptions to approved event types, VM resource types, and exact CSV blob paths. |
| Service Bus access | Limit data sender and receiver roles to the Event Grid delivery identity and Function App identity. |
| Queue failure handling | Monitor dead-letter queues and do not replay messages until the underlying failure has been corrected. |
| Function networking | Keep public access disabled where required and validate private DNS, SCM access, VNet integration, and route-all behavior. |
| Storage security | Keep containers private, disable anonymous access, enforce TLS 1.2, and limit data-plane permissions. |
| Application settings | Do not store passwords, client secrets, or sensitive tokens in Function App settings. |
 
> [!CAUTION]
> Never commit passwords, private keys, token values, secret values, or unapproved production identifiers into Git.
 
---
 
## 19. Troubleshooting Guide
 
| Issue | Likely cause | Recommended action |
|---|---|---|
| Pipeline does not start | Missing or incorrect PR label. | Confirm the correct `Arizona` or `Virginia` label is applied. |
| Wrong environment pipeline starts | Incorrect label or workflow mapping. | Review label-to-workflow mapping. |
| `terraform init` fails | Backend configuration or permissions issue. | Confirm backend storage account, container, key, and access. |
| Azure authentication fails | OIDC or federated credential issue. | Validate GitHub/Azure federated credential configuration. |
| `terraform validate` fails | Terraform syntax or variable structure issue. | Review changed `.tf` files and `variables.tf` contracts. |
| `terraform plan` fails due to missing key | A logical key in `terraform.tfvars` does not match a map entry. | Check `resource_group_key`, `subnet_key`, `hostpool_key`, `key_vault_key`, and `image_version_key`. |
| Key Vault secret lookup fails | Secret name is wrong or identity lacks access. | Confirm secret exists and deployment identity can read it. |
| Domain join fails | Credential, DNS, network, or domain permission issue. | Validate domain join secrets, DNS path, and domain controller reachability. |
| Session host does not register | Host pool registration or VM extension issue. | Review VM extension status and host pool registration configuration. |
| Monitoring data missing | AMA, DCR, DCE, or association issue. | Validate extension status and DCR/DCE associations. |
| Private endpoint connectivity fails | DNS, subnet, or target resource configuration issue. | Validate private DNS and endpoint approval/configuration. |
| Event Grid event is not delivered | Event filter, system topic source, delivery identity, or Service Bus permissions are incorrect. | Validate the included event type, advanced filters, queue endpoint, and managed identity RBAC. |
| Service Bus message reaches dead-letter queue | Function processing failed repeatedly or the message exceeded TTL/max delivery count. | Review dead-letter reason, Function App logs, queue name settings, and retry behavior before resubmitting. |
| Function App does not trigger | Service Bus connection settings, managed identity, queue name, runtime, or network access is incorrect. | Validate `ServiceBusConnection__fullyQualifiedNamespace`, client ID, queue app settings, VNet integration, private DNS, and Function App runtime. |
| Function deployment returns 403/404 | SCM endpoint, private DNS, public access, runner network path, or storage content access is unavailable. | Confirm the runner resolves and reaches the Function App SCM private endpoint and that the Function App can access its storage account. |
| Function logs are missing | Application Insights connection or Function App logging settings are incorrect. | Validate Application Insights connection settings and check Function App/Application Insights live logs. |
| Alert does not notify | Action group or alert scope is incorrect. | Confirm alert scope, signal, severity, and receivers. |
| Plan shows unexpected removals | `terraform.tfvars` entry was removed/commented or key changed. | Stop and review before approval. Do not apply until impact is understood. |
 
---
 
## Appendix A: Module Catalog
 
| Module | Purpose | Main inputs | Main outputs / result |
|---|---|---|---|
| `ActionGroup` | Creates Azure Monitor notification groups. | `actionGroupVariables` | Action group map and IDs. |
| `Alerts` | Creates monitoring alert rules and connects them to action groups. | `alertVariables`, `action_group_ids` | Alert rules. |
| `AppServicePlan` | Creates the Windows hosting plan used by the Function App. | `appServicePlanVariables` | App Service Plan resources, IDs, and names. |
| `ApplicationGroup` | Creates AVD desktop or remote application groups. | `applicationGroupVariables`, `hostpool_ids` | Application group map and IDs. |
| `ApplicationGroupAssignment` | Assigns existing Entra ID groups to AVD Application Groups. | `application_group_assignments`, `application_group_ids` | Desktop Virtualization User role assignments. |
| `ApplicationInsights` | Creates Function App telemetry and links it to Log Analytics. | `applicationInsightsVariables` | Resources, connection strings, and instrumentation keys. |
| `AzureMonitorAgent` | Installs Azure Monitor Agent on session hosts. | Session host VM IDs and extension settings. | AMA VM extensions. |
| `ComputeGallery` | Creates Azure Compute Galleries. | `acgVariables` | Compute gallery map. |
| `ComputeGalleryDefinition` | Creates image definitions inside galleries. | `imageDefinitionVariables` | Image definition map. |
| `ComputeGalleryImageVersion` | Looks up approved existing image versions. | `imageVersionDataVariables` | Image version data and IDs. |
| `DCE` | Creates Data Collection Endpoints. | `dceVariables` | DCE map and IDs. |
| `DCEAssociation` | Associates Data Collection Endpoints with target resources. | `dceAssociations` | DCE associations. |
| `DCR` | Creates Data Collection Rules for Windows events and performance counters. | `dcrVariables` | DCR map and IDs. |
| `DCRAssociation` | Associates Data Collection Rules with session hosts. | `dcrAssociations` | DCR associations. |
| `DiagnosticSetting` | Routes supported resource logs and metrics to Log Analytics. | `diagnostic_settings` | Diagnostic setting resources. |
| `EventGridSubscription` | Filters events and routes matching events to Service Bus queues. | `eventGridSubscriptionVariables` | Event Grid subscriptions. |
| `EventGridSystemTopic` | Creates topics for resource notification and Storage Account event sources. | `eventGridSystemTopicVariables` | Event Grid system topics. |
| `Hostpool` | Creates AVD host pools and registration information. | `hostPoolVariables` | Host pool map, IDs, and registration tokens. |
| `Keyvault` | Creates Key Vaults using the approved access model. | `keyVaultVariables` | Key Vault map and IDs. |
| `LogAnalyticsWorkspace` | Creates Log Analytics Workspaces. | `logAnalyticsWorkspaceVariables` | Workspace map and IDs. |
| `ManagedIdentity` | Creates user-assigned managed identities for automation. | `mIdentity` | Identity resources, IDs, principal IDs, and client IDs. |
| `NetworkInterface` | Creates NICs for session host VMs. | `nicVariables` | NIC map and IDs. |
| `NetworkSecurityGroup` | Creates NSGs and security rules. | `nsgVariables` | NSG map and IDs. |
| `NvidiaGpuExtension` | Installs the NVIDIA GPU driver extension on selected GPU session hosts. | VM IDs, extension name/publisher/type/version, and enablement map. | NVIDIA VM extensions. |
| `PrivateEndPoint` | Creates private endpoints for supported Azure services and subresources. | `privateEndpointVariables` | Private endpoint resources and connections. |
| `ResourceGroup` | Creates Azure Resource Groups. | `rgVariables` | Resource group map. |
| `ScalingPlan` | Creates AVD scaling plans and host pool schedules. | `scalingPlanVariables`, `hostpool_ids`, `resource_group_ids` | Scaling plan resources. |
| `ServiceBusNamespace` | Creates the Service Bus namespace with security and network controls. | `serviceBusNamespaceVariables` | Namespace map, IDs, names, and endpoints. |
| `ServiceBusQueue` | Creates automation queues with retry, TTL, and dead-letter settings. | `serviceBusQueueVariables`, resolved namespace IDs. | Queue map, IDs, and names. |
| `ServiceHealthAlert` | Creates Azure Service Health alert rules. | `serviceHealthAlertVariables`, `action_group_ids_map` | Service Health alerts. |
| `SessionHost` | Creates Windows session host VMs and required extensions. | Resolved `sessionHosts`, NIC IDs, host pool IDs, image IDs, and secrets. | Session host VMs and registration information. |
| `SessionHostUnregister` | Unregisters selected/deleted session hosts from AVD host pools. | Host pool IDs and deleted session host names. | Host pool cleanup actions. |
| `StorageAccount` | Creates Function runtime storage and private CSV containers. | `storageAccountVariables`, `storageContainerVariables` | Storage accounts and containers. |
| `Subnet` | Creates subnets in existing VNets, including optional delegation. | `snetVariables` | Subnet map and IDs. |
| `WindowsFunctionApp` | Creates the Windows PowerShell Function App with identity, runtime, app settings, and VNet integration. | `windowsFunctionAppVariables` plus resolved plan, storage, identity, subnet, Service Bus, and Application Insights values. | Function App resources, IDs, names, and hostnames. |
| `Workspace` | Creates AVD Workspaces. | `workspaceVariables` | Workspace map and IDs. |
| `WorkspaceAppGroupAssociation` | Associates AVD Workspaces with Application Groups. | `workspaceAssociationVariables`, workspace IDs, application group IDs. | Workspace/Application Group associations. |
| `nsgSubnetAssociation` | Associates NSGs with subnets. | `nsgSubnetAssociations`, NSG IDs, subnet IDs. | NSG-to-subnet associations. |
 
---

## Appendix B: Providers Explanation
 
Terraform providers are plugins that allow Terraform to interact with Azure services and APIs.
 
This repository uses three providers:
 
| Provider | Purpose in this Repository |
|---|---|
| `azurerm` | Deploys and manages standard Azure infrastructure resources. |
| `azapi` | Performs Azure operations that are not currently supported through the AzureRM provider, such as Session Host unregistration workflows. |
| `azuread` | Supports Microsoft Entra ID (Azure AD) integrations and is used by Azure Virtual Desktop Scaling Plan configurations. |
 
---
 
### AzureRM Provider
 
The AzureRM provider is the primary provider used throughout this repository.
 
It is responsible for creating and managing the majority of Azure resources, including:
 
- Resource Groups
- Virtual Networks and Subnets
- Network Security Groups
- Network Interfaces
- Azure Virtual Desktop Workspaces
- Azure Virtual Desktop Host Pools
- Application Groups
- Session Host Virtual Machines
- Key Vaults
- Log Analytics Workspaces
- Azure Monitor resources
- Private Endpoints
 
Example:
 
```hcl
provider "azurerm" {
  features {}
}
```
 
Use Case:
 
```text
Use AzureRM whenever the Azure resource is fully supported by the Terraform AzureRM provider.
```
 
---
 
### AzAPI Provider
 
The AzAPI provider allows Terraform to interact directly with Azure Resource Manager APIs.
 
This repository uses AzAPI for functionality that is not available through the AzureRM provider.
 
Current use case:
 
- Unregistering Session Hosts from Azure Virtual Desktop Host Pools during resource removal operations.
- Supporting the SessionHostUnregister module.
 
Example:
 
```hcl
provider "azapi" {}
```
 
Use Case:
 
```text
When a Session Host is removed from terraform.tfvars, the AzAPI provider is used to unregister the Session Host from the Host Pool before the virtual machine is removed.
```
 
Why AzAPI is required:
 
```text
AzureRM does not currently provide native functionality for all AVD Session Host unregister operations. AzAPI enables direct interaction with the underlying Azure API.
```
 
---
 
### AzureAD Provider
 
The AzureAD provider enables Terraform to interact with Microsoft Entra ID (formerly Azure Active Directory).
 
Current use case:
 
- Azure Virtual Desktop Scaling Plan configuration.
- Entra ID-related lookups and identity integrations.
 
Example:
 
```hcl
provider "azuread" {}
```
 
Use Case:
 
```text
The AzureAD provider is used by Scaling Plan resources and identity-related operations that require interaction with Microsoft Entra ID.
```
 
Why AzureAD is required:
 
```text
Some Azure Virtual Desktop features integrate with Microsoft Entra ID and require identity-aware provider functionality outside standard Azure infrastructure management.
```
 
---
 
### Provider Version Management
 
Provider versions are managed within `provider.tf`.
 
Example:
 
```hcl
terraform {
  required_providers {
 
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
 
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.0"
    }
 
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
}
```
 
---
 
### Provider Configuration Location
 
Provider configuration is maintained separately for each environment.
 
```text
infra/envs/env-arizona/provider.tf
infra/envs/env-virginia/provider.tf
```
 
These files define:
 
- Terraform version requirements
- Provider versions
- Azure Government cloud configuration
- Authentication settings
- Provider features
 
---
 
### Best Practices
 
- Pin provider versions to avoid unexpected deployment behavior.
- Review provider release notes before upgrading.
- Test provider upgrades in non-production environments first.
- Review Terraform plans after provider version changes.
- Use AzureRM whenever native support exists.
- Use AzAPI only when direct Azure API functionality is required.
- Use AzureAD for Microsoft Entra ID and identity-related integrations.
 
## Appendix C: Locals Explanation
 
`locals.tf` is used to convert friendly input values into the final values required by Azure resources.
 
For example, instead of requiring users to paste full Azure resource IDs into `terraform.tfvars`, the repository can use readable keys such as:
 
- `resource_group_key`
- `subnet_key`
- `hostpool_key`
- `key_vault_key`
- `image_version_key`
 
`locals.tf` resolves those keys into actual names, IDs, and complete module input objects.
 
| Local value | What it does |
|---|---|
| `snetVariableslocal` | Resolves VNet details for subnet creation. |
| `nsgSubnetAssociations` | Resolves NSG and subnet IDs for association. |
| `imageDefinitionVariables` | Adds compute gallery details to image definition input. |
| `privateEndpointTargetIds` | Builds target resource IDs for private endpoints. |
| `privateEndpointVariables` | Resolves subnet and target IDs for private endpoint creation. |
| `diagnosticSettings` | Builds standardized diagnostic settings input. |
| `imageVersionDataVariablesResolved` | Resolves gallery and resource group names for image version lookup. |
| `generated_session_hosts` | Expands one session host group into one object per VM. |
| `nicVariables` | Creates NIC input for each generated session host. |
| `session_hosts_resolved` | Builds final session host VM input. |
| `unregister_session_hosts` | Builds input used for AVD unregister behavior when session hosts are removed from desired config. |
| `hostpoolRegistrationVariables` | Builds registration input for host pools. |
| `dcrVariablesResolved` | Resolves Log Analytics destinations for DCRs. |
| `dcrAssociationVariablesResolved` | Builds VM-level DCR associations. |
 
---
 
## Appendix D: Existing Azure Data Lookups
 
The repository uses Terraform data blocks to read existing Azure resources or secrets.
 
| Data lookup | Purpose |
|---|---|
| `data.azurerm_virtual_network.vnet` | Reads an existing VNet. This repo creates subnets inside that VNet. |
| `data.azurerm_key_vault.session_host` | Reads the Key Vault referenced by session host configuration. |
| `data.azurerm_key_vault_secret.session_host_admin_username` | Reads local admin username. |
| `data.azurerm_key_vault_secret.session_host_admin_password` | Reads local admin password. |
| `data.azurerm_key_vault_secret.session_host_domain_join_username` | Reads domain join username. |
| `data.azurerm_key_vault_secret.session_host_domain_join_password` | Reads domain join password. |
 
---
 
## Appendix E: Application Group Assignment
 
The `ApplicationGroupAssignment` module assigns an existing Entra ID / Azure AD group to an Azure Virtual Desktop Application Group.
 
The group is not created by Terraform in this flow. The group already exists in Entra ID / Azure AD, and Terraform uses the group object ID as `principal_id` for the Azure role assignment.
 
Example implementation pattern:
 
```hcl
resource "azurerm_role_assignment" "avd_assignment" {
  for_each = var.application_group_assignments
 
  scope                = var.application_group_ids[each.value.application_group_key]
  role_definition_name = "Desktop Virtualization User"
  principal_id         = each.value.azuread_group_object_id
  principal_type       = "Group"
}
```
 
Example variable pattern:
 
```hcl
variable "application_group_assignments" {
  description = "Map of existing Azure AD / Entra ID groups to assign to AVD Application Groups. Use group object IDs to avoid Microsoft Graph read permissions during pipeline runs."
 
  type = map(object({
    application_group_key   = string
    azuread_group_object_id = string
  }))
 
  default = {}
}
```
 
Example `terraform.tfvars` pattern:
 
```hcl
application_group_assignments = {
  va_avd_group_assignment_1 = {
    application_group_key   = "va-avd-ag-prod-1"
    azuread_group_object_id = "00000000-0000-0000-0000-000000000000"
  }
}
```
 
---
 
## Final Summary
 
This repository provides a controlled, repeatable, and reviewable way to deploy Azure Virtual Desktop infrastructure in Azure Government.
 
The most important points for client understanding are:
 
- The AVD platform is deployed through Terraform rather than manual portal configuration.
- Arizona and Virginia are managed as separate environment folders.
- The pipeline validates and plans changes before applying them.
- Session host capacity is controlled through `terraform.tfvars`.
- Standard resource removal is performed by commenting/removing desired configuration in `terraform.tfvars`, reviewing the plan, and applying through the approved pipeline.
- Secrets must remain in Key Vault and must not be committed to Git.
- Monitoring, alerting, and service health visibility are part of the platform design.
