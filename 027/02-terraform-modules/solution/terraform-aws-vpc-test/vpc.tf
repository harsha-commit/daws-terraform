module "vpc-test" {
  source               = "../terraform-aws-vpc"
  project_name         = var.project_name
  environment          = var.environment
  public_cidr_blocks   = var.public_cidr_blocks
  private_cidr_blocks  = var.private_cidr_blocks
  database_cidr_blocks = var.database_cidr_blocks
}