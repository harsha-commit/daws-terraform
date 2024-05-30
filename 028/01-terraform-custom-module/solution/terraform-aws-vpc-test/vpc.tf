module "vpc-test" {
  source               = "../terraform-aws-vpc"
  project_name         = var.project_name
  environment          = var.environment
  common_tags          = var.common_tags
  public_cidr_blocks   = var.public_cidr_blocks
  private_cidr_blocks  = var.private_cidr_blocks
  database_cidr_blocks = var.database_cidr_blocks

  is_peering_required = var.is_peering_required
  # peer_vpc_id = "<SOME_VPC_ID_HERE>"
}