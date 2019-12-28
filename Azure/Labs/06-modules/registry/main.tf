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

module "vnet" {
    source              = "Azure/vnet/azurerm"
    resource_group_name = "my-tf-rg"
    location            = "westus"
    address_space       = "10.0.0.0/16"
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    subnet_names        = ["subnet1", "subnet2", "subnet3"]

    tags                = {
                            environment = "dev"
                            costcenter  = "it"
                          }
}