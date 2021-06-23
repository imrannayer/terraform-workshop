variable "x_vpc_cidr_list" {
  description = "Name of VPC network"
  default = ["10.100.0.0/16", "10.101.0.0/16", "10.102.0.0/16",]
}

resource "aws_vpc" "vpc_list" {
  cidr_block  = element(var.x_vpc_cidr_list, 0)

  tags = {
    Name      = "vpc_list"
  }
}