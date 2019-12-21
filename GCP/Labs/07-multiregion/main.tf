provider "google" {
  region = "us-central1"
}
provider "google" {
  region = "us-east1"
  alias = "east1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-tf-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet_east" {

  provider      = "google.east1"


  name          = "my-tf-subnet1-east"
  ip_cidr_range = "10.10.1.0/24"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "vpc_subnet_central" {
  name          = "my-tf-subnet1-central"
  ip_cidr_range = "10.10.2.0/24"
  network       = google_compute_network.vpc_network.self_link
}