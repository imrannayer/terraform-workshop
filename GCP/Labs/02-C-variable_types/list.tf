variable "x_network_name_list" {
  description = "Name of VPC networks"
  default     = ["my-tf-vpc-1", "my-tf-vpc-2", "my-tf-vpc-3"]
}

resource "google_compute_network" "vpc_network_list" {
  name  = element(var.x_network_name_list, 0)


  auto_create_subnetworks = false
}