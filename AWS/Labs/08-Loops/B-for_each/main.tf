provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}


########################  List of IP  #############################

# variable "x_vpc_cidr_list" {
#   description = "Create RG with these names"
#   type        = list(string)
#   default     = ["10.1.0.0/16", "10.3.0.0/16"]
# }




variable "x_vpc_cidr_list" {
  description = "Create RG with these names"
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
}
resource "aws_vpc" "vpc_network_list" {
  for_each = toset (var.x_vpc_cidr_list)
  cidr_block  = each.value

  tags = {
    Name = "myvpc"
  }

}


########################  Map of IP  #############################

variable "x_vpc_cidr_map" {
  description = "Create RG with these names"
  type        = map(string)
  default     = {
                  map_vpc1 = "10.10.0.0/16"
                  map_vpc2 = "10.11.0.0/16"
                  map_vpc3 = "10.12.0.0/16"
                }
}

resource "aws_vpc" "vpc_network_map" {
  for_each = var.x_vpc_cidr_map
  cidr_block  = each.value

  tags = {
    Name = each.key
  }

}

########################  Map of Maps of IP and other details  #############################

# variable "x_vpc_cidr_map_of_maps" {
#   description = "Create RG with these names"
#   type        = map(map(string))
#   default     = {
#                   list_vpc1 =  {cidr = "10.20.0.0/16"
#                            name = "myvpc01"
#                            dns_support = true
#                           }
#                   list_vpc2 =  {cidr = "10.21.0.0/16"
#                            name = "myvpc02"
#                            dns_support = false
#                           }
#                   list_vpc3 =  {cidr = "10.22.0.0/16"
#                            name = "myvpc03"
#                            dns_support = false
#                           }
#                 }
# }

# resource "aws_vpc" "vpc_network_map_of_map" {
#   for_each = var.x_vpc_cidr_map_of_maps
#     cidr_block          = each.value.cidr
#     enable_dns_support  = each.value.dns_support
#     tags = {
#       Name = each.key
#     }
# }






output A_vpc_list {
  value = aws_vpc.vpc_network_list
}

output "B_all_values_list" {
  value       = values(aws_vpc.vpc_network_list)
  description = "The ID of all vpcs"
}

output "C_all_id" {
  value       = values(aws_vpc.vpc_network_list)[*].id
  description = "The ID of all vpcs"
}

output "D_first_id" {
  value       = values(aws_vpc.vpc_network_list)[0].id
  description = "The ID of all vpcs"
}
