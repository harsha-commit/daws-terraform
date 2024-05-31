resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id" # Always start with /
  type  = "String"
  value = module.vpc-test.vpc_id # From output of module
}

resource "aws_ssm_parameter" "vpc_cidr_block" {
  name  = "/${var.project_name}/${var.environment}/vpc_cidr_block" # Always start with /
  type  = "String"
  value = module.vpc-test.vpc_cidr_block # From output of module
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = module.vpc-test.public_subnet_ids
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = module.vpc-test.private_subnet_ids
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type  = "StringList"
  value = module.vpc-test.database_subnet_ids
}
