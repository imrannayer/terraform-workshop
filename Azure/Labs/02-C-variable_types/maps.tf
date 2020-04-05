
variable "x_location_map" {
  description = "The location/region"
  default     = {
    sc    = "southcentralus"
    eus   = "eastus"
    wus   = "westus"
    cus   = "centralus"
    eus2  = "eastus2"
  }
}


resource "azurerm_resource_group" "rg_map" {
  name     = "example-my-tf-rg-map"
  location = lookup(var.x_location_map, "eus", "centralus")
}
