provider "google" {
  # credentials = "${file("account.json")}"
  # project     = "my-project-id"
  # region      = "us-central1"
}
module "myresource-1" {
  source        = "../modules"
  net_prefix    = "my-third"
}

output vpc_id {
  value = module.myresource-1.vpcnet.self_link
}
output vpcnet {
  value = module.myresource-1.vpcnet
}