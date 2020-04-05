variable "x_location_list" {
  description = "The location/region"
  default     = ["southcentralus", "eastus", "westus", "centralus", ]
}

resource "azurerm_resource_group" "rg_list" {
  name     = "example-my-tf-rg-list"
  location = element(var.x_location_list,0)
}
