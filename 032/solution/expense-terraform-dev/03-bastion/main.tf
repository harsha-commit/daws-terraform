module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.project_name

  instance_type          = "t3.micro"
  key_name               = "user1"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  subnet_id              = "subnet-eddcdzz4"

  tags = merge(var.common_tags, var.bastion_tags, {
    Name = var.project_name
  })
}
