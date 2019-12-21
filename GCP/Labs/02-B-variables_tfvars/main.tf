provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

variable "x_network_name" {
  description = "Name of VPC network"
}

resource "google_compute_network" "vpc_network" {
  name                    = var.x_network_name
  auto_create_subnetworks = false
}