provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

data "terraform_remote_state" "myvpc" {
  backend = "local"

  config = {
    path = "../A-vpc/terraform.tfstate"
  }
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "my-tf-subnet1"
  ip_cidr_range = "10.10.10.0/24"

##################
  network       = data.terraform_remote_state.myvpc.outputs.vpc_self_link
}