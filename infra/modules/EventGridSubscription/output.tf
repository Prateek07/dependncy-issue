output "eventGridSubscription" {
  description = "Map of Event Grid system topic event subscriptions."
  value       = azurerm_eventgrid_system_topic_event_subscription.eventGridSubscription
}
