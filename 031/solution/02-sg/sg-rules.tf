resource "aws_security_group_rule" "db_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.db.sg_id
  source_security_group_id = module.backend.sg_id
}

resource "aws_security_group_rule" "backend_frontend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.backend.sg_id
  source_security_group_id = module.frontend.sg_id
}

resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.frontend.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}


