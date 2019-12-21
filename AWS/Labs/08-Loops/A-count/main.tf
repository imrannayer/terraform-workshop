provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

# variable "x_vpc_cidr" {
#   description = "Create RG with these names"
#   type        = list(string)
#   default     = ["10.10.0.0/16", "10.30.0.0/16"]
# }




variable "x_vpc_cidr" {
  description = "Create VPC with these CIDR"
  type        = list(string)
  default     = ["10.10.0.0/16", "10.20.0.0/16", "10.30.0.0/16"]
}

resource "aws_vpc" "vpc_network" {
  count = length(var.x_vpc_cidr)
  cidr_block  = var.x_vpc_cidr[count.index]
}

output vpc_list {
  value = aws_vpc.vpc_network
}