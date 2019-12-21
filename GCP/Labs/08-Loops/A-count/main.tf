provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}


variable "vpc_name" {
  description = "VPC names"
  type        = list(string)
  default     = ["first", "second," "third"]
}

resource "google_compute_network" "vpc_network" {
  count                   = length(var.vpc_name)
  name                    = var.vpc_name[count.index]
  auto_create_subnetworks = false
}


output vpc_list {
  value = google_compute_network.vpc_network
}
