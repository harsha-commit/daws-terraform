module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"
  ami  = data.aws_ami.this.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  # Convert StringList to List
  subnet_id = element(split(",", data.aws_ssm_parameter.public_subnet_ids.value), 0)

  tags = merge(var.common_tags, var.bastion_tags, {
    Name = "${var.project_name}-${var.environment}-bastion"
  })
}
