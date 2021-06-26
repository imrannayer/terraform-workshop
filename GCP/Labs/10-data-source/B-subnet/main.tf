provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  region      = "us-central1"
}

data "google_compute_network" "myvpc" {
  name = "my-tf-vpc-network"
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "my-tf-subnet1"
  ip_cidr_range = "10.10.10.0/24"

##################
  network       = data.google_compute_network.myvpc.self_link
}