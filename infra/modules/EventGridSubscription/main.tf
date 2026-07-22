resource "azurerm_eventgrid_system_topic_event_subscription" "eventGridSubscription" {
  for_each = var.eventGridSubscriptionVariables
 
  name                = each.value.name
  system_topic        = each.value.system_topic
  resource_group_name = each.value.resource_group_name
 
  included_event_types = each.value.included_event_types
 
  service_bus_queue_endpoint_id = try(each.value.service_bus_queue_endpoint_id, null)
  service_bus_topic_endpoint_id = try(each.value.service_bus_topic_endpoint_id, null)
  eventhub_endpoint_id          = try(each.value.eventhub_endpoint_id, null)
  hybrid_connection_endpoint_id = try(each.value.hybrid_connection_endpoint_id, null)
 
  event_delivery_schema                  = try(each.value.event_delivery_schema, "EventGridSchema")
  advanced_filtering_on_arrays_enabled   = try(each.value.advanced_filtering_on_arrays_enabled, false)
  labels                                 = try(each.value.labels, [])
  expiration_time_utc                    = try(each.value.expiration_time_utc, null)
 
  dynamic "subject_filter" {
    for_each = try(each.value.subject_filter, null) == null ? [] : [each.value.subject_filter]
 
    content {
      subject_begins_with = try(subject_filter.value.subject_begins_with, null)
      subject_ends_with   = try(subject_filter.value.subject_ends_with, null)
      case_sensitive      = try(subject_filter.value.case_sensitive, false)
    }
  }
 
  dynamic "advanced_filter" {
    for_each = (
      try(length(each.value.operation_names), 0) +
      try(length(each.value.advanced_filter.bool_equals), 0) +
      try(length(each.value.advanced_filter.number_greater_than), 0) +
      try(length(each.value.advanced_filter.number_greater_than_or_equals), 0) +
      try(length(each.value.advanced_filter.number_less_than), 0) +
      try(length(each.value.advanced_filter.number_less_than_or_equals), 0) +
      try(length(each.value.advanced_filter.number_in), 0) +
      try(length(each.value.advanced_filter.number_not_in), 0) +
      try(length(each.value.advanced_filter.number_in_range), 0) +
      try(length(each.value.advanced_filter.number_not_in_range), 0) +
      try(length(each.value.advanced_filter.string_begins_with), 0) +
      try(length(each.value.advanced_filter.string_not_begins_with), 0) +
      try(length(each.value.advanced_filter.string_ends_with), 0) +
      try(length(each.value.advanced_filter.string_not_ends_with), 0) +
      try(length(each.value.advanced_filter.string_contains), 0) +
      try(length(each.value.advanced_filter.string_not_contains), 0) +
      try(length(each.value.advanced_filter.string_in), 0) +
      try(length(each.value.advanced_filter.string_not_in), 0) +
      try(length(each.value.advanced_filter.is_not_null), 0) +
      try(length(each.value.advanced_filter.is_null_or_undefined), 0)
    ) > 0 ? [1] : []
 
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
 
      dynamic "string_contains" {
        for_each = try(each.value.advanced_filter.string_contains, [])
 
        content {
          key    = string_contains.value.key
          values = string_contains.value.values
        }
      }
 
      dynamic "string_not_contains" {
        for_each = try(each.value.advanced_filter.string_not_contains, [])
 
        content {
          key    = string_not_contains.value.key
          values = string_not_contains.value.values
        }
      }
 
      dynamic "string_in" {
        for_each = concat(
          try(length(each.value.operation_names), 0) > 0 ? [
            {
              key    = "data.resourceInfo.type"
              values = each.value.operation_names
            }
          ] : [],
          try(each.value.advanced_filter.string_in, [])
        )
 
        content {
          key    = string_in.value.key
          values = string_in.value.values
        }
      }
 
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
    for_each = try(each.value.delivery_identity_id, null) == null ? [] : [1]
 
    content {
      type                   = try(each.value.delivery_identity_type, "UserAssigned")
      user_assigned_identity = each.value.delivery_identity_id
    }
  }
 
  dynamic "dead_letter_identity" {
    for_each = try(each.value.dead_letter_identity_id, null) == null ? [] : [1]
 
    content {
      type                   = try(each.value.dead_letter_identity_type, "UserAssigned")
      user_assigned_identity = each.value.dead_letter_identity_id
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
}