provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
  features {}
}

variable "rg_name_list" {
  description = "Create RG with these names"
  type        = list(string)
  default     = ["first", "second", "third"]
}


module "myresource-1" {
  for_each          = toset(var.rg_name_list)
  source            = "../modules"
  name_prefix       = each.value
  resource_location = "southcentralus"
}
