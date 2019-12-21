provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-tf-vpc-network"
  auto_create_subnetworks = false

# Enable following property after resource is created

  # routing_mode            = "GLOBAL"



# enabling following property wiill recreate resource. 

  # description             = "Terraform Test network"
}