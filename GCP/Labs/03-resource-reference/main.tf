provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-tf-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "my-tf-subnet1"
  ip_cidr_range = "10.10.10.0/24"
  network       = google_compute_network.vpc_network.self_link
}