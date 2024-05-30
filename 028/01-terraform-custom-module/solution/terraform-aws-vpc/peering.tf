### VPC Peering ###

resource "aws_vpc_peering_connection" "this" {
  count       = var.is_peering_required ? 1 : 0
  peer_vpc_id = var.peer_vpc_id == "" ? data.aws_vpc.this.id : var.peer_vpc_id # Acceptor
  vpc_id      = aws_vpc.main.id                                                # Requestor
  auto_accept = var.peer_vpc_id == ""
}

