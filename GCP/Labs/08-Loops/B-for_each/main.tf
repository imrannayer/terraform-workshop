provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}


## There is quota limit of 5 vpc. enable one resource (3 VPC) at a time
########################  List of vpc  #############################

variable "vpc_name_list" {
  description = "VPC names"
  type        = list(string)
  default     = ["list-first", "list-second", "list-third"]
}


# resource "google_compute_network" "vpc_network_list" {
#   for_each                = toset (var.vpc_name_list)
#   name                    = each.value
#   auto_create_subnetworks = false
# }


########################  Map of vpc  #############################

variable "vpc_name_map" {
  description = "Create RG with these names"
  type        = map(string)
  default     = {
                  map_vpc1 = "map-first"
                  map_vpc2 = "map-second"
                  map_vpc3 = "map-third"
                }
}

# resource "google_compute_network" "vpc_network_map" {
#   for_each = var.vpc_name_map
#   name  = each.value
# }

########################  Map of Maps of names and other details  #############################

variable "x_vpc_name_map_of_maps" {
  description = "Create RG with these names"
  type        = map(map(string))
  default     = {
                  "mom_vpc1" =  {
                                vpc_name = "mom-first"
                                vpc_description = "Maps of maps firist vpc"
                              }
                  "mom_vpc2" =  {
                                vpc_name = "mom-second"
                                vpc_description = "Maps of maps second vpc"
                              }
                  "mom_vpc3" =  {
                                vpc_name = "mom-third"
                                vpc_description = "Maps of maps third vpc"
                              }
                }
}

resource "google_compute_network" "vpc_network_mom" {
  for_each = var.x_vpc_name_map_of_maps
  name  = each.value.vpc_name
  description = each.value.vpc_description
}




# output A_vpc_list {
#   value = google_compute_network.vpc_network_list
# }

# output "B_all_values_list" {
#   value       = values(google_compute_network.vpc_network_list)
#   description = "The ID of all vpcs"
# }

# output "C_all_id" {
#   value       = values(google_compute_network.vpc_network_list)[*].id
#   description = "The ID of all vpcs"
# }

# output "D_first_id" {
#   value       = values(google_compute_network.vpc_network_list)[0].id
#   description = "The ID of all vpcs"
# }
