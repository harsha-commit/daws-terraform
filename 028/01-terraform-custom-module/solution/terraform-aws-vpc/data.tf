# Get All Avaiablity Zones of User's Region

data "aws_availability_zones" "this" {
  state = "available"
}

# VPC ID of Default VPC

data "aws_vpc" "this" {
  default = true
  state   = "available"
}

# For CIDR of VPC Peering

data "aws_vpc_peering_connection" "this" {
  id = aws_vpc_peering_connection.this[0].id
}
