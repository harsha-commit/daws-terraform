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

### Security Group Rules ###

# DB is accepting connections from Backend
resource "aws_security_group_rule" "db_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.db.sg_id
  source_security_group_id = module.backend.sg_id
}

# Backend is accepting connections from Frontend
resource "aws_security_group_rule" "backend_frontend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.frontend.sg_id
}

# Frontend is accepting connections from Public
resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.frontend.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}
