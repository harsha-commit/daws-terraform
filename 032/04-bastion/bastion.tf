module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"
  ami  = data.aws_ami.ami_info.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  subnet_id              = element(split(",", data.aws_ssm_parameter.public_subnets_ids.value), 0)

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion"
    Project     = var.project_name
    Environment = var.environment
  }
}
