
resource "azurerm_eventgrid_system_topic_event_subscription" "eventGridSubscription" {
  for_each = var.eventGridSubscriptionVariables
 
  name                = each.value.name
  system_topic        = each.value.system_topic
  resource_group_name = each.value.resource_group_name
 
  expiration_time_utc  = try(each.value.expiration_time_utc, null)
  event_delivery_schema = try(each.value.event_delivery_schema, "EventGridSchema")
 
  eventhub_endpoint_id          = try(each.value.eventhub_endpoint_id, null)
  hybrid_connection_endpoint_id = try(each.value.hybrid_connection_endpoint_id, null)
  service_bus_queue_endpoint_id = try(each.value.service_bus_queue_endpoint_id, null)
  service_bus_topic_endpoint_id = try(each.value.service_bus_topic_endpoint_id, null)
 
  included_event_types = each.value.included_event_types
 
  advanced_filtering_on_arrays_enabled = try(each.value.advanced_filtering_on_arrays_enabled, false)
  labels                               = try(each.value.labels, [])
 
  dynamic "azure_function_endpoint" {
    for_each = try(each.value.azure_function_endpoint, null) == null ? [] : [each.value.azure_function_endpoint]
    content {
      function_id                       = azure_function_endpoint.value.function_id
      max_events_per_batch              = try(azure_function_endpoint.value.max_events_per_batch, null)
      preferred_batch_size_in_kilobytes = try(azure_function_endpoint.value.preferred_batch_size_in_kilobytes, null)
    }
  }
 
  dynamic "storage_queue_endpoint" {
    for_each = try(each.value.storage_queue_endpoint, null) == null ? [] : [each.value.storage_queue_endpoint]
    content {
      storage_account_id                    = storage_queue_endpoint.value.storage_account_id
      queue_name                            = storage_queue_endpoint.value.queue_name
      queue_message_time_to_live_in_seconds = try(storage_queue_endpoint.value.queue_message_time_to_live_in_seconds, null)
    }
  }
 
  dynamic "webhook_endpoint" {
    for_each = try(each.value.webhook_endpoint, null) == null ? [] : [each.value.webhook_endpoint]
    content {
      url                                = webhook_endpoint.value.url
      max_events_per_batch               = try(webhook_endpoint.value.max_events_per_batch, null)
      preferred_batch_size_in_kilobytes  = try(webhook_endpoint.value.preferred_batch_size_in_kilobytes, null)
      active_directory_tenant_id         = try(webhook_endpoint.value.active_directory_tenant_id, null)
      active_directory_app_id_or_uri     = try(webhook_endpoint.value.active_directory_app_id_or_uri, null)
    }
  }
 
  dynamic "subject_filter" {
    for_each = try(each.value.subject_filter, null) == null ? [] : [each.value.subject_filter]
    content {
      subject_begins_with = try(subject_filter.value.subject_begins_with, null)
      subject_ends_with   = try(subject_filter.value.subject_ends_with, null)
      case_sensitive      = try(subject_filter.value.case_sensitive, null)
    }
  }
 
  dynamic "advanced_filter" {
    for_each = try(length(each.value.operation_names), 0) > 0 || try(each.value.advanced_filter, null) != null ? [1] : []
    content {
      dynamic "bool_equals" {
        for_each = try(each.value.advanced_filter.bool_equals, [])
        content {
          key   = bool_equals.value.key
          value = bool_equals.value.value
        }
      }
 
      dynamic "number_greater_than" {
        for_each = try(each.value.advanced_filter.number_greater_than, [])
        content {
          key   = number_greater_than.value.key
          value = number_greater_than.value.value
        }
      }
 
      dynamic "number_greater_than_or_equals" {
        for_each = try(each.value.advanced_filter.number_greater_than_or_equals, [])
        content {
          key   = number_greater_than_or_equals.value.key
          value = number_greater_than_or_equals.value.value
        }
      }
 
      dynamic "number_less_than" {
        for_each = try(each.value.advanced_filter.number_less_than, [])
        content {
          key   = number_less_than.value.key
          value = number_less_than.value.value
        }
      }
 
      dynamic "number_less_than_or_equals" {
        for_each = try(each.value.advanced_filter.number_less_than_or_equals, [])
        content {
          key   = number_less_than_or_equals.value.key
          value = number_less_than_or_equals.value.value
        }
      }
 
      dynamic "number_in" {
        for_each = try(each.value.advanced_filter.number_in, [])
        content {
          key    = number_in.value.key
          values = number_in.value.values
        }
      }
 
      dynamic "number_not_in" {
        for_each = try(each.value.advanced_filter.number_not_in, [])
        content {
          key    = number_not_in.value.key
          values = number_not_in.value.values
        }
      }
 
      dynamic "number_in_range" {
        for_each = try(each.value.advanced_filter.number_in_range, [])
        content {
          key    = number_in_range.value.key
          values = number_in_range.value.values
        }
      }
 
      dynamic "number_not_in_range" {
        for_each = try(each.value.advanced_filter.number_not_in_range, [])
        content {
          key    = number_not_in_range.value.key
          values = number_not_in_range.value.values
        }
      }
 
      dynamic "string_begins_with" {
        for_each = try(each.value.advanced_filter.string_begins_with, [])
        content {
          key    = string_begins_with.value.key
          values = string_begins_with.value.values
        }
      }
 
      dynamic "string_not_begins_with" {
        for_each = try(each.value.advanced_filter.string_not_begins_with, [])
        content {
          key    = string_not_begins_with.value.key
          values = string_not_begins_with.value.values
        }
      }
 
      dynamic "string_ends_with" {
        for_each = try(each.value.advanced_filter.string_ends_with, [])
        content {
          key    = string_ends_with.value.key
          values = string_ends_with.value.values
        }
      }
 
      dynamic "string_not_ends_with" {
        for_each = try(each.value.advanced_filter.string_not_ends_with, [])
        content {
          key    = string_not_ends_with.value.key
          values = string_not_ends_with.value.values
        }
      }
 
      dynamic "string_in" {
        for_each = try(each.value.advanced_filter.string_in, [])
        content {
          key    = string_in.value.key //"data.resourceInfo.type"
          values = string_in.value.values
        }
      }
 
      dynamic "string_not_contains" {
        for_each = try(each.value.advanced_filter.string_not_contains, [])
        content {
          key    = string_not_contains.value.key
          values = string_not_contains.value.values
        }
      }
      dynamic "string_contains" {
        for_each = try(each.value.advanced_filter.string_contains, [])
        content {
          key    = string_contains.value.key
          values = string_contains.value.values
        }
      }
 
      # dynamic "string_contains" {
      #   for_each = concat(
      #     try(length(each.value.operation_names), 0) > 0 ? [{
      #       key    = "data.resourceInfo.type"
      #       values = each.value.operation_names
      #     }] : [],
      #     try(each.value.advanced_filter.string_contains, [])
      #   )
      #   content {
      #     key    = string_contains.value.key
      #     values = string_contains.value.values
      #   }
      # }
 
      dynamic "string_not_in" {
        for_each = try(each.value.advanced_filter.string_not_in, [])
        content {
          key    = string_not_in.value.key
          values = string_not_in.value.values
        }
      }
 
      dynamic "is_not_null" {
        for_each = try(each.value.advanced_filter.is_not_null, [])
        content {
          key = is_not_null.value.key
        }
      }
 
      dynamic "is_null_or_undefined" {
        for_each = try(each.value.advanced_filter.is_null_or_undefined, [])
        content {
          key = is_null_or_undefined.value.key
        }
      }
    }
  }
 
  dynamic "delivery_identity" {
    for_each = try(each.value.delivery_identity_id, null) != null || try(each.value.delivery_identity_type, null) == "SystemAssigned" ? [1] : []
    content {
      type                   = try(each.value.delivery_identity_type, "UserAssigned")
      user_assigned_identity = try(each.value.delivery_identity_id, null)
    }
  }
 
  dynamic "delivery_property" {
    for_each = try(each.value.delivery_properties, [])
    content {
      header_name  = delivery_property.value.header_name
      type         = delivery_property.value.type
      value        = try(delivery_property.value.value, null)
      source_field = try(delivery_property.value.source_field, null)
      secret       = try(delivery_property.value.secret, null)
    }
  }
 
  dynamic "dead_letter_identity" {
    for_each = try(each.value.dead_letter_identity_id, null) != null || try(each.value.dead_letter_identity_type, null) == "SystemAssigned" ? [1] : []
    content {
      type                   = try(each.value.dead_letter_identity_type, "UserAssigned")
      user_assigned_identity = try(each.value.dead_letter_identity_id, null)
    }
  }
 
  dynamic "storage_blob_dead_letter_destination" {
    for_each = try(each.value.storage_blob_dead_letter_destination, null) == null ? [] : [each.value.storage_blob_dead_letter_destination]
    content {
      storage_account_id          = storage_blob_dead_letter_destination.value.storage_account_id
      storage_blob_container_name = storage_blob_dead_letter_destination.value.storage_blob_container_name
    }
  }
 
  retry_policy {
    max_delivery_attempts = try(each.value.max_delivery_attempts, 10)
    event_time_to_live    = try(each.value.event_time_to_live, 1440)
  }
 
  dynamic "timeouts" {
    for_each = try(each.value.timeouts, null) == null ? [] : [each.value.timeouts]
    content {
      create = try(timeouts.value.create, null)
      read   = try(timeouts.value.read, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }
 
  # lifecycle {
  #   prevent_destroy = true
  # }
}
