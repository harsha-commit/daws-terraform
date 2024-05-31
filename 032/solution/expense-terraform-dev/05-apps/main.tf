module "backend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-backend"
  ami  = data.aws_ami.this.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]

  subnet_id = element(split(",", data.aws_ssm_parameter.private_subnet_ids.value), 0)

  tags = merge(var.common_tags, var.backend_tags, {
    Name = "${var.project_name}-${var.environment}-backend"
  })
}

module "frontend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-frontend"
  ami  = data.aws_ami.this.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg_id.value]

  subnet_id = element(split(",", data.aws_ssm_parameter.public_subnet_ids.value), 0)

  tags = merge(var.common_tags, var.frontend_tags, {
    Name = "${var.project_name}-${var.environment}-frontend"
  })
}
