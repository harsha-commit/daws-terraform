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

module "backend_alb" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "backend-alb"
  environment    = var.environment
  sg_description = "Security Group for Backend ALB Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
}

module "vpn" {
  source         = "../terraform-aws-sg"
  project_name   = var.project_name
  sg_name        = "vpn"
  environment    = var.environment
  sg_description = "Security Group for VPN Instance/s"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value # .value for paramaters
  inbound_rules  = var.vpn_sg_rules
}
