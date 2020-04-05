variable "x_vpc_cidr_map" {
  description = "Name of VPC network"
  default = {
    first   = "10.10.0.0/16"
    second  = "10.11.0.0/16"
    third   = "10.12.0.0/16"
  }
}
resource "aws_vpc" "vpc_map" {
  cidr_block  = lookup(var.x_vpc_cidr_map, "first", "10.200.0.0/16")

  tags = {
    Name      = "vpc_map"
  }
}