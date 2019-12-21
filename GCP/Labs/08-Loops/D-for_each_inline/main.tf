provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}


resource "google_compute_network" "vpc_network" {
  name                    = "my-tf-vpc-network"
  auto_create_subnetworks = false
}


resource "google_compute_firewall" "vpc_firewall" {
  name    = "test-firewall"
  network = "${google_compute_network.vpc_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  allow {
    protocol = "udp"
    ports    = ["53"]
  }

}

variable "inbound_ip_map" {
  description = "Inbound IP addresses"
  type        = map(string)
  default     = {
    tcp = ["80", "8080", "1000-2000"]
    udp = ["80", "8080", "1000-2000"]
  }
}

# variable "inbound_ip_list" {
#   description = "Inbound IP addresses"
#   type        = list(string)
#   default     = ["80", "8080", "1000-2000"]
# }
