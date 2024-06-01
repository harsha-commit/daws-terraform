locals {
  availability_zones = slice(data.aws_availability_zones.this.names, 0, 2)
}