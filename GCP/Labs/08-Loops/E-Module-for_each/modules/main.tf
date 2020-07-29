variable net_prefix {
  description = "prefix for network resource name"
}

resource "google_compute_network" "vpc_network" {
  name                    = "${var.net_prefix}-my-tf-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "${var.net_prefix}-my-tf-subnet1"
  ip_cidr_range = "10.10.10.0/24"
  network       = google_compute_network.vpc_network.self_link
}

output vpcnet {
  value = google_compute_network.vpc_network
}

output subnet1 {
  value = google_compute_subnetwork.vpc_subnet
}