variable "x_network_name_map" {
  description = "Name of VPC networks"
  default     = {
    first   = "my-tf-vpc-1"
    second  = "my-tf-vpc-2"
    third   = "my-tf-vpc-3"
  }
}

resource "google_compute_network" "vpc_network_list" {
  name  = lookup(var.x_network_name_map, "first", "my-tf-vpc-999")

  auto_create_subnetworks = false
}