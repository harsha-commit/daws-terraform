module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion-public"
  ami  = data.aws_ami.this.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  # Convert StringList to List
  subnet_id = element(split(",", data.aws_ssm_parameter.public_subnet_ids.v