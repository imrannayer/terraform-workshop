terraform {
  required_version = ">= 0.13.0-rc1"
}
provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}

# module "myresource-2" {
#   source        = "../modules"
#   net_prefix    = "my-second"
# }

variable vpc_prefixes {
  default = ["my-first", "my-second"]
}

module "myresource-1" {
  for_each      = toset(var.vpc_prefixes)
  source        = "../modules"
  net_prefix    = each.value
}
