provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-tf-vpc-network"
  auto_create_subnetworks = false
}

output "vpc_self_link" {
  value = google_compute_network.vpc_network.self_link
}
