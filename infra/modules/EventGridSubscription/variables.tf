
variable "eventGridSubscriptionVariables" {
  description = "Map of Event Grid subscriptions from system topic to supported handlers. Defaults still target Service Bus queue for VM delete events."
  type = map(object({
    name                = string
    system_topic        = string
    resource_group_name = string
 
    expiration_time_utc = optional(string)
    event_delivery_schema = optional(string, "EventGridSchema")
 
    azure_function_endpoint = optional(object({
      function_id                         = string
      max_events_per_batch                = optional(number)
      preferred_batch_size_in_kilobytes   = optional(number)
    }))
 
    eventhub_endpoint_id            = optional(string)
    hybrid_connection_endpoint_id   = optional(string)
    service_bus_queue_endpoint_id   = optional(string)
    service_bus_topic_endpoint_id   = optional(string)
 
    storage_queue_endpoint = optional(object({
      storage_account_id                   = string
      queue_name                           = string
      queue_message_time_to_live_in_seconds = optional(number)
    }))
 
    webhook_endpoint = optional(object({
      url                                = string
      max_events_per_batch               = optional(number)
      preferred_batch_size_in_kilobytes  = optional(number)
      active_directory_tenant_id         = optional(string)
      active_directory_app_id_or_uri     = optional(string)
    }))
 
    included_event_types = optional(list(string), ["Microsoft.Resources.ResourceDeleteSuccess"])
 
    subject_filter = optional(object({
      subject_begins_with = optional(string)
      subject_ends_with   = optional(string)
      case_sensitive      = optional(bool)
    }))
 
    operation_names = optional(list(string), ["Microsoft.Compute/virtualMachines/delete"])
    advanced_filtering_on_arrays_enabled = optional(bool, false)
 
    advanced_filter = optional(object({
      bool_equals = optional(list(object({
        key   = string
        value = bool
      })), [])
 
      number_greater_than = optional(list(object({
        key   = string
        value = number
      })), [])
 
      number_greater_than_or_equals = optional(list(object({
        key   = string
        value = number
      })), [])
 
      number_less_than = optional(list(object({
        key   = string
        value = number
      })), [])
 
      number_less_than_or_equals = optional(list(object({
        key   = string
        value = number
      })), [])
 
      number_in = optional(list(object({
        key    = string
        values = list(number)
      })), [])
 
      number_not_in = optional(list(object({
        key    = string
        values = list(number)
      })), [])
 
      number_in_range = optional(list(object({
        key    = string
        values = list(list(number))
      })), [])
 
      number_not_in_range = optional(list(object({
        key    = string
        values = list(list(number))
      })), [])
 
      string_begins_with = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_not_begins_with = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_ends_with = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_not_ends_with = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_contains = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_not_contains = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_in = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      string_not_in = optional(list(object({
        key    = string
        values = list(string)
      })), [])
 
      is_not_null = optional(list(object({
        key = string
      })), [])
 
      is_null_or_undefined = optional(list(object({
        key = string
      })), [])
    }))
 
    delivery_identity_type = optional(string, "UserAssigned")
    delivery_identity_id   = optional(string)
 
    delivery_properties = optional(list(object({
      header_name  = string
      type         = string
      value        = optional(string)
      source_field = optional(string)
      secret       = optional(bool)
    })), [])
 
    dead_letter_identity_type = optional(string, "UserAssigned")
    dead_letter_identity_id   = optional(string)
 
    storage_blob_dead_letter_destination = optional(object({
      storage_account_id            = string
      storage_blob_container_name   = string
    }))
 
    max_delivery_attempts = optional(number, 10)
    event_time_to_live    = optional(number, 1440)
    labels                = optional(list(string), [])
 
    timeouts = optional(object({
      create = optional(string)
      read   = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
  }))
  default = {}
}
