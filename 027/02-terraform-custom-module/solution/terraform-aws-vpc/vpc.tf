resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(local.common_tags, var.vpc_tags, {
    Name = "${var.project_name}-${var.environment}-vpc"
  })
}
