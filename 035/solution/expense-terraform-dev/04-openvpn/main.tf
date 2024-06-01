module "vpn" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-vpn"
  ami  = data.aws_ami.this.id

  key_name = aws_key_pair.this.key_name

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]

  # Convert StringList to List
  subnet_id = element(split(",", data.aws_ssm_parameter.public_subnet_ids.value), 0)

  tags = merge(var.common_tags, var.vpn_tags, {
    Name = "${var.project_name}-${var.environment}-vpn"
  })
}

resource "aws_key_pair" "this" {
  key_name   = "openvpn"
  public_key = file("~/.ssh/openvpn.pub")
}
