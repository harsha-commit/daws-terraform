locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = true
  }
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
}
