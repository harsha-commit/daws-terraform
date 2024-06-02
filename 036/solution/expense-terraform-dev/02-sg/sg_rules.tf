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

# DB is accepting connections from Bastion
resource "aws_security_group_rule" "db_bastion" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.db.sg_id
  source_security_group_id = module.bastion.sg_id
}

# DB is accepting connections from VPN
resource "aws_security_group_rule" "db_vpn" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.db.sg_id
  source_security_group_id = module.vpn.sg_id
}

# Backend is accepting connections from Backend ALB
resource "aws_security_group_rule" "backend_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.backend_alb.sg_id
}

# Backend is accepting connections from Bastion
resource "aws_security_group_rule" "backend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.bastion.sg_id
}

# Backend is accepting connections from VPN http
resource "aws_security_group_rule" "backend_vpn_http" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.vpn.sg_id
}

# Backend is accepting connections from VPN ssh
resource "aws_security_group_rule" "backend_vpn_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.vpn.sg_id
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

# Frontend is accepting connections from Public
resource "aws_security_group_rule" "frontend_public_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.frontend.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}

# Frontend is accepting connections from Bastion
resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.frontend.sg_id
  source_security_group_id = module.bastion.sg_id
}

# Frontend is accepting connections from VPC
resource "aws_security_group_rule" "frontend_vpn" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.frontend.sg_id
  source_security_group_id = module.vpn.sg_id
}

# Frontend is accepting connections from Frontend ALB
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.frontend.sg_id
  source_security_group_id = module.frontend_alb.sg_id
}

# Bastion is accepting connections from Public
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.bastion.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}

# Backend ALB is accepting connections from Frontend
resource "aws_security_group_rule" "backend_alb_frontend" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.backend_alb.sg_id
  source_security_group_id = module.frontend.sg_id
}

# Backend ALB is accepting connections from VPN
resource "aws_security_group_rule" "backend_alb_vpn" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.backend_alb.sg_id
  source_security_group_id = module.vpn.sg_id
}

# Frontend ALB is accepting connections from Public HTTP
resource "aws_security_group_rule" "frontend_alb_public_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.frontend_alb.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "frontend_alb_public_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.frontend_alb.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}

