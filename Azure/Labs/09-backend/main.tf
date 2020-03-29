provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
  features {}
}

# Change name of resource_group_name, storage_account_name,  container_name and Create it in your account 

terraform {
  backend "azurerm" {
    resource_group_name  = "mybackendrg99"
    storage_account_name = "mybackendsa99"
    container_name       = "mybackend99"
    key                  = "hr.app1.network.terraform.tfstate"
  }
}
resource "azurerm_resource_group" "rg" {
  name     = "my-tf-rg"
  location = "southcentralus"
}
