provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}
# Change name of bucket and Create it in your account 
terraform {
  backend "gcs" {
    bucket  = "mybackend99"
    prefix  = "hr/app1/network"
  }
}
resource "google_compute_network" "vpc_network" {
  name                    = "my-tf-vpc-network"
  auto_create_subnetworks = false
}