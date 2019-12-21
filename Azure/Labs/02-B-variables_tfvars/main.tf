variable "x_resource_group" {
  description = "The name of the resource group in which to create the virtual network."
}

variable "x_location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}
resource "azurerm_resource_group" "rg" {
  name     = var.x_resource_group
  location = var.x_location
}