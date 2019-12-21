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

resource "azurerm_virtual_network" "vnet" {
  name                = "my-tf-vnet-network"
  location            = "southcentralus"
  address_space       = ["10.10.0.0/16"]

  resource_group_name = azurerm_resource_group.rg.name
}

output vnet {
   value = azurerm_virtual_network.vnet
 }

 output vnet_id {
   value = azurerm_virtual_network.vnet.id
 }