provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}

variable "x_resource_group" {
  description = "The name of the resource group in which to create the virtual network."
  default = "my-tf-rg"
}

variable "x_location" {
  description = "The location/region"
  default     = "southcentralus"
}
resource "azurerm_resource_group" "rg" {
  name     = "example-${var.x_resource_group}"
  location = var.x_location
}