# DB Rules

resource "aws_security_group_rule" "db_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.db.sg_id
  source_security_group_id = module.backend.sg_id
}

resource "aws_security_group_rule" "db_bastion" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.db.sg_id
  source_security_group_id = module.bastion.sg_id
}

# Backend Rules

resource "aws_security_group_rule" "backend_frontend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.frontend.sg_id
}

resource "aws_security_group_rule" "backend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.bastion.sg_id
}

resource "aws_security_group_rule" "backend_ansible" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.ansible.sg_id
}

# Frontend Rules

resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.frontend.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.frontend.sg_id
  source_security_group_id = module.bastion.sg_id
}

resource "aws_security_group_rule" "frontend_ansible" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.frontend.sg_id
  source_security_group_id = module.ansible.sg_id
}

# Bastion Rules

resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.bastion.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ansible Rules

resource "aws_security_group_rule" "ansible_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.ansible.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}
