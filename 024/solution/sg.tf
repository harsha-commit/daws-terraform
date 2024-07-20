resource "aws_security_group" "this" {

  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port   = var.sg_port
    to_port     = var.sg_port
    protocol    = var.sg_protocol
    cidr_blocks = var.sg_cidr_blocks
  }
}
