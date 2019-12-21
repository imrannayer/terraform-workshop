provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {}
output "list_aws_az" {
  value = data.aws_availability_zones.available
}
