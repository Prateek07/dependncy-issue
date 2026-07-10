variable "snetVariables" {
  description = "Map of subnets to create"
  type = map(object({
    vnetname       = string
    vnetrg        = string
    snetName      = string
    snetAddressPrefix = list(string)
    service_endpoints                             = optional(list(string), [])
    service_endpoint_policy_ids                   = optional(list(string), [])
    private_endpoint_network_policies             = optional(string, "Disabled")
    private_link_service_network_policies_enabled = optional(bool, true)
    delegations = optional(list(object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    })), [])
  }))
}
