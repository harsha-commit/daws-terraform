data "aws_ssm_parameter" "database_subnets_ids" {
  name = "/${var.project_name}/${var.environment}/database_subnets_ids"
}

data "aws_ssm_parameter" "db_sg_id" {
  name = "/${var.project_name}/${var.environment}/db_sg_id"
}
