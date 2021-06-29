provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "my-tf-rg"
}

resource "azurerm_virtual_network" "vnet" {
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  name                = "my-tf-vnet-network"
  address_space       = ["10.10.0.0/16"]

}
