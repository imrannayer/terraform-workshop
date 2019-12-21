provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

module "myresource-1" {
  source        = "../modules"
  name_prefix   = "my-third"
}

output vpc_id {
  value = module.myresource-1.vpcnet.id
}
output vpcnet {
  value = module.myresource-1.vpcnet
}