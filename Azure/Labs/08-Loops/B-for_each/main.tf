########################  List of RG  #############################


variable "rg_name_list" {
  description = "Create RG with these names"
  type        = list(string)
  default     = ["first", "second", "third"]
}


resource "azurerm_resource_group" "rg_list" {
  for_each = toset (var.rg_name_list)
  name  = each.value
  location = "southcentralus"
}

output A_rg_list {
  value = azurerm_resource_group.rg_list
}


########################  Map of RG  #############################

variable "rg_name_map" {
  description = "Create RG with these names"
  type        = map(string)
  default     = {
                  prod = "firstmap", 
                  qa = "secondmap", 
                  dev = "thirdmap"
                }
}


resource "azurerm_resource_group" "rg_map" {
  for_each = var.rg_name_map
  name  = each.value
  location = "southcentralus"
  tags = {
    environment = each.key
  }
}

output B_rg_maps {
  value = azurerm_resource_group.rg_map
}


########################  Maps of Map  #############################

variable "rg_name_map_of_map" {
  description = "Create RG with these names"
  type        = map(map(string))
  default     = {
                  prod = { 
                          name = "firstmom"
                          location = "southcentralus"
                        } 
                  qa  = { 
                          name = "secondmom"
                          location = "East US"
                        } 
                  dev = { 
                          name = "thirdmom"
                          location = "East US"
                        } 
                }
}


resource "azurerm_resource_group" "rg_map_of_map" {
  for_each = var.rg_name_map_of_map
    name      = each.value.name
    location  = each.value.location
  tags = {
    environment = each.key
  }
}

output B_rg_maps_of_maps {
  value = azurerm_resource_group.rg_map_of_map
}
