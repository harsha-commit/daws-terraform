# Route Tables

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags, var.rtb_tags, {
    Name = "${var.project_name}-${var.environment}-rtb-public"
  })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags, var.rtb_tags, {
    Name = "${var.project_name}-${var.environment}-rtb-private"
  })
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags, var.rtb_tags, {
    Name = "${var.project_name}-${var.environment}-rtb-database"
  })
}

# Route Tables Association

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  subnet_id      = aws_subnet.database[0].id
  route_table_id = aws_route_table.database.id
}

# Routes

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route" "database" {
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route" "public_default" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.this.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}

resource "aws_route" "default_public" {
  route_table_id            = data.aws_vpc.this.main_route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}
