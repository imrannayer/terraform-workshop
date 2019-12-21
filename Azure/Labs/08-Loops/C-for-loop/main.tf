####### Operations on list 

variable "var_list" {
  description = "List of strings"
  type        = list(string)
  default     = ["First_value", "second_value", "third_value"]
}

output A_1_values_in_list {
  value = [for x in var.var_list : x]
}

output A_2_convert_list_as_maps {
  value = {for x , y in var.var_list : x => y}
}


####### Operations on map 

variable "var_map" {
  description = "Map key values"
  type        = map(string)
  default     = {
    first_key   = "First_value"
    second_key  = "second_value"
    third_key   = "third_value"
  }
}

output B_1_convert_map_as_list {
  value = [for x in var.var_map : x]
  # value = [for x, y in var.var_map : y]
}

output B_2_map_as_map_with_updated {
  value = {
    for x, y in var.var_map : 
    x => upper(y)
  }
}


### QUESTION: Create above exampe with map of numbers and show result with value + 100



####### Operations on list of maps 

variable "var_list_of_maps" {
  description = "Variable list of maps"
  type        = list(map(string))
  default     = [
    {
      name   = "a"
      number = 1
    },
    {
      name   = "b"
      number = 2
    },
    {
      name   = "c"
      number = 3
    },
  ]
}

output C_1_list_of_map_updated {
  value = [for x in var.var_list_of_maps : {
    name  = x.name
    upd_value   = x.number + 100
    }]
}


output C_2_list_of_map_to_single_value_from_map {
  value = [for x in var.var_list_of_maps : x.name]
}

output C_3_maps_of_maps {
  value = {for x , y in var.var_list_of_maps : x => y}
}





# output C_4_list_of_map_single_value {
#   value = [for x in var.var_list_of_maps : x]
# }
