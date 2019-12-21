provider "azurerm" {
  # subscription_id = "your_subscription_id"
  # client_id       = "your_appId"
  # client_secret   = "your_password"
  # tenant_id       = "your_tenant_id"
}
resource "azurerm_resource_group" "myrg" {
  # for_each = toset (var.mylist)
  name     = "my-tf-rg"
  location = "southcentralus"
}


####### Dynamic nested inline block 

variable "inbound_ip_map" {
  description = "Inbound IP addresses"
  type        = map(string)
  default     = {
    100 = "40.71.37.173/32"
    200 = "40.71.37.174/32"
    300 = "40.71.37.175/32"
  }
}

resource "azurerm_network_security_group" "mysg_map" {
  name                = "my-tf-sg_map"
  location            = "${azurerm_resource_group.myrg.location}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"

  dynamic "security_rule" {
    for_each = var.inbound_ip_map
    content {
      # keys and values from map
      name                        = "allow_ib_${security_rule.key}"
      priority                    = security_rule.key
      source_address_prefix       = security_rule.value
      # hard coded values
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_range           = "*"
      destination_port_range      = "*"
      destination_address_prefix  = "*"
    }
  }
}



########## Same example with list instead of map

variable "inbound_ip_list" {
  description = "Inbound IP addresses"
  type        = list(string)
  default     = ["40.71.37.173/32", "40.71.37.174/32", "40.71.37.175/32"]
}



resource "azurerm_network_security_group" "mysg_list" {
  name                = "my-tf-sg_list"
  location            = "${azurerm_resource_group.myrg.location}"
  resource_group_name = "${azurerm_resource_group.myrg.name}"

  dynamic "security_rule" {
    for_each = var.inbound_ip_list
    content {
      # keys and values from map
      name                        = "allow_ib_${security_rule.key}"
      priority                    = security_rule.key + 100
      source_address_prefix       = security_rule.value
      # hard coded values
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "*"
      source_port_range           = "*"
      destination_port_range      = "*"
      destination_address_prefix  = "*"
    }
  }
}



######## Without dynamic nested block

# resource "azurerm_network_security_group" "mysg" {
#   name                = "my-tf-sg"
#   location            = "${azurerm_resource_group.myrg.location}"
#   resource_group_name = "${azurerm_resource_group.myrg.name}"

#   security_rule {
#     priority                   = 100
#     source_address_prefix      = "40.71.37.173/32"
#     name                       = "allow_ib_100"
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     destination_address_prefix = "*"
#   }
#   security_rule {
#     priority                   = 200
#     source_address_prefix      = "40.71.37.174/32"
#     name                       = "allow_ib_200"
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     destination_address_prefix = "*"
#   }
#   security_rule {
#     priority                   = 200
#     source_address_prefix      = "40.71.37.175/32"
#     name                       = "allow_ib_300"
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     destination_address_prefix = "*"
#   }
# }








