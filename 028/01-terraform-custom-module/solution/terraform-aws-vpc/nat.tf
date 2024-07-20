resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(local.common_tags, var.nat_tags, {
    Name = "${var.project_name}-${var.environment}-ngw"
  })

  depends_on = [aws_internet_gateway.this]
}

resource "aws_eip" "this" {
  domain = "vpc"
  tags = merge(local.common_tags, var.eip_tags, {
    Name = "${var.project_name}-${var.environment}-eip"
  })
}
