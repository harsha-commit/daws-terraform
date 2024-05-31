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
