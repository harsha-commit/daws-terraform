module "expense_vpc" {
  source             = "git::https://github.com/harsha-commit/terraform-aws-vpc.git"
  project_name       = var.project_name
  environment        = var.environment
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  database_subnets   = var.database_subnets
}
