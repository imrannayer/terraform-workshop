provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my-tf-rg"
  location = "southcentralus"
}

# https://registry.terraform.io/modules/Azure/vnet/azurerm/2.1.0

module "network" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 2.1"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  subnet_names        = ["mySubnet1", "mySubnet2"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
}