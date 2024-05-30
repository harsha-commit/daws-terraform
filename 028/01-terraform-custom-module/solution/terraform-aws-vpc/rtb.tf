### Public Route Table ###

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.public_rtb_tags, {
    Name = "${var.project_name}-${var.environment}-rtb-public"
  })
}

### Public Routes ###

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

### Public Route Table and Public Subnet Associations ###

resource "aws_route_table_association" "public" {
  count          = length(var.public_cidr_blocks)
  subnet_id      = element(aws_subnet.public[*].id, count.index) # aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

### Private Route Table ###

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.private_rtb_tags, {
    Name = "${var.project_name}-${var.environment}-rtb-private"
  })
}

### Private Routes ###

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

### Private Route Table and Private Subnet Associations ###

resource "aws_route_table_association" "private" {
  count          = length(var.private_cidr_blocks)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

### Database Route Table ###

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.database_rtb_tags, {
    Name = "${var.project_name}-${var.environment}-rtb-database"
  })
}

### Database Routes ###

resource "aws_route" "database" {
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

### Database Route Table and Database Subnet Associations ###

resource "aws_route_table_association" "database" {
  count          = length(var.database_cidr_blocks)
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.database.id
}

### Public Subnet to VPC Peering Route ###
resource "aws_route" "public_peering" {
  count                  = var.is_peering_required ? 1 : 0
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = data.aws_vpc_peering_connection.this.cidr_block
  # count generates tuple, so we have to use indexing
  vpc_peering_connection_id = aws_vpc_peering_connection.this[0].id
}

### Default Subnet to VPC Peering Route ###
resource "aws_route" "default_peering" {
  count                     = var.is_peering_required && var.peer_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc_peering_connection.this.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this[0].id
}

