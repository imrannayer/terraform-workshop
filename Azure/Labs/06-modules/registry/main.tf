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
# https://registry.terraform.io/modules/Azure/network/azurerm/2.0.0
module "network" {
    source              = "Azure/network/azurerm"
    version             = "2.0.0"
    location            = "southcentralus"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    address_space       = "10.0.0.0/16"
    subnet_names        = ["mySubnet"]
    subnet_prefixes     = ["10.0.1.0/24"]
}