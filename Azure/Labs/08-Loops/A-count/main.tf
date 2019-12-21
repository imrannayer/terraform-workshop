provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}


variable "mylist" {
  description = "Create RG with these names"
  type        = list(string)
  default     = ["first", "second", "third"]
}

# variable "mylist" {
#   description = "Create RG with these names"
#   type        = list(string)
#   default     = ["first", "third"]
# }


resource "azurerm_resource_group" "rg" {
  count = length(var.mylist)
  name  = var.mylist[count.index]
  location = "southcentralus"
}

output rglist {
  value = azurerm_resource_group.rg
}

output "all_id" {
  value       = azurerm_resource_group.rg[*].id
  description = "The ID of all rg"
}