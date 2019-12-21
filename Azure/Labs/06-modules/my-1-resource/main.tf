provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}

module "myresource-1" {
  source            = "../modules"
  name_prefix       = "my-first"
  resource_location = "southcentralus"
}

module "myresource-2" {
  source            = "../modules"
  name_prefix       = "my-second"
  resource_location = "southcentralus"
}