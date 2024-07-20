# AZs from Region (mentioned in Provider.tf)
data "aws_availability_zones" "available" {
  state = "available"
}
