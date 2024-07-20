resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = each.value

  for_each               = var.instance_names
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = merge(var.common_tags, {
    Name = each.key
  })
}
