### NAT Gateway ###

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.allocation_id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.common_tags, var.nat_tags, {
    Name = "${var.project_name}-${var.environment}-eip-public"
  })

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]
}