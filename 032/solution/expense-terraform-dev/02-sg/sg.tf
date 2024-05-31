module "db" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "db"
  environment    = var.environment
  sg_description = "Security Group for Database Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
}

module "backend" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "backend"
  environment    = var.environment
  sg_description = "Security Group for Backend Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
}

module "frontend" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "frontend"
  environment    = var.environment
  sg_description = "Security Group for Frontend Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
}

module "bastion" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "bastion"
  environment    = var.environment
  sg_description = "Security Group for Bastion Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
}

module "ansible" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "ansible"
  environment    = var.environment
  sg_description = "Security Group for Ansible Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
}
