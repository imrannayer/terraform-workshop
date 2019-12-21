provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}

data "terraform_remote_state" "rg" {
  backend = "local"

  config = {
    path = "../A-rg/terraform.tfstate"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "my-tf-vnet-network"
  location            = "southcentralus"
  address_space       = ["10.10.0.0/16"]

  resource_group_name = data.terraform_remote_state.rg.outputs.rg_name
}
