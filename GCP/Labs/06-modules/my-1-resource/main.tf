provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}
module "myresource-1" {
  source        = "../modules"
  net_prefix    = "my-first"
}
module "myresource-2" {
  source        = "../modules"
  net_prefix    = "my-second"
}