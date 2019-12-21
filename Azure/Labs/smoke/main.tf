provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}

data "azurerm_subscription" "current" {}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current
}
