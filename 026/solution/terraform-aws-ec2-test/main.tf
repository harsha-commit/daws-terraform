module "ec2-test" {
  source        = "../terraform-aws-ec2"
  instance_type = var.instance_type
  port          = var.port
  protocol      = var.protocol
  tags          = var.tags
}