provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}

module "myresource-1" {
  source            = "../modules"
  name_prefix       = "my-third"
  resource_location = "southcentralus"
}


output net {
  value = module.myresource-1.myvnet
}

output net_name {
  value = module.myresource-1.myvnet.name
}