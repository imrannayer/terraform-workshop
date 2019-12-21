provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}
provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
  alias  = "arm2"
}

resource "azurerm_resource_group" "rg_arm1" {
  name     = "my-tf-rg-arm1"
  location = "southcentralus"
}
resource "azurerm_resource_group" "rg_arm2" {

  provider    = "azurerm.arm2"

  name     = "my-tf-rg-arm2"
  location = "East US"
}
