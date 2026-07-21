output "applicationInsights"{
  description = "Application Insights IDs by key."
  value       = azurerm_application_insights.applicationInsights

}
# output "applicationInsightsIds" {
#   description = "Application Insights resource IDs by key."
#   value = {
#     for key, value in azurerm_application_insights.applicationInsights : key => value.id
#   }
# } 
output "application_insights_connection_strings" {
  description = "Application Insights connection strings by key."
  value = {
    for key, value in azurerm_application_insights.applicationInsights : key => value.connection_string
  }
  sensitive = true
}
output "application_insights_instrumentation_keys" {
  description = "Application Insights instrumentation keys by key."
  value = {
    for key, value in azurerm_application_insights.applicationInsights : key => value.instrumentation_key
  }
  sensitive = true
}
 