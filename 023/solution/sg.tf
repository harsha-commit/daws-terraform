resource "aws_security_group" "this" {

  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port   = var.sg_port
    to_port     = var.sg_port
    protocol    = var.sg_protocol
    cidr_blocks = var.sg_cidr_blocks
  }

  egress {
    from_port   = var.sg_port
    to_port     = var.sg_port
    protocol    = var.sg_protocol
    cidr_blocks = var.sg_cidr_blocks
  }
}
