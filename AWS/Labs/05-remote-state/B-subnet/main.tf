provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

##################
# Reference Remote state file to get output values
data "terraform_remote_state" vpc {
  backend = "local"

  config = {
    path = "../A-vpc/terraform.tfstate"
  }
}


resource "aws_subnet" "subnet1" {
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "my-tf-vpc-subnet1"
  }

# Refer to vpc ID
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
}