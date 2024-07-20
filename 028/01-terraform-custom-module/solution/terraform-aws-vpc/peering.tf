resource "aws_vpc_peering_connection" "main" {
  vpc_id      = aws_vpc.main.id
  peer_vpc_id = data.aws_vpc.this.id
  auto_accept = true
  tags = merge(local.common_tags, var.peering_tags, {
    Name = "${var.project_name}-${var.environment}-peering"
  })
}
