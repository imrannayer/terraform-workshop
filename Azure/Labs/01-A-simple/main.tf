provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}

resource "azurerm_resource_group" "rg" {
  name     = "my-tf-rg"
  location = "southcentralus"
}
