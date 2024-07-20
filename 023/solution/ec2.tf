resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = var.instance_names[count.index] == "db" ? "t2.small" : "t2.micro"

  count                  = length(var.instance_names)
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = merge(var.common_tags, {
    Name = var.instance_names[count.index]
  })
}
