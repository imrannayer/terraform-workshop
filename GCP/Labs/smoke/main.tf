provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

data "google_compute_regions" "regions" {}
data "google_compute_zones" "zones" {}

output "myregions" {
  value = data.google_compute_regions.regions.names
}
output "myzones" {
  value = data.google_compute_zones.zones.names
}