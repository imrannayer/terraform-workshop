variable "name_prefix" {
  description = "Prefiix for neetwoork names"
}
variable "resource_location" {
  description = "Resource location"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-my-tf-rg"
  location = "southcentralus"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name_prefix}-my-tf-vnet-network"
  location            = var.resource_location
  address_space       = ["10.10.0.0/16"]

  resource_group_name = azurerm_resource_group.rg.name
}

output myvnet {
  value = azurerm_virtual_network.vnet
}
output myrg {
  value = azurerm_resource_group.rg
}
