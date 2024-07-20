resource "aws_instance" "this" {
  ami      = data.aws_ami.rhel_ami.id
  for_each = var.instance_names

  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = merge(var.common_tags, {
    Name = each.key
  })


}
