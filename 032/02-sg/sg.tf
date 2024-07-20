module "db" {
  source         = "git::https://github.com/harsha-commit/terraform-aws-sg.git"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "db"
  sg_description = "Security Group for db"
}

module "backend" {
  source         = "git::https://github.com/harsha-commit/terraform-aws-sg.git"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "backend"
  sg_description = "Security Group for backend"
}

module "frontend" {
  source         = "git::https://github.com/harsha-commit/terraform-aws-sg.git"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "frontend"
  sg_description = "Security Group for frontend"
}

module "bastion" {
  source         = "git::https://github.com/harsha-commit/terraform-aws-sg.git"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "bastion"
  sg_description = "Security Group for bastion"
}

module "ansible" {
  source         = "git::https://github.com/harsha-commit/terraform-aws-sg.git"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "ansible"
  sg_description = "Security Group for ansible"
}
