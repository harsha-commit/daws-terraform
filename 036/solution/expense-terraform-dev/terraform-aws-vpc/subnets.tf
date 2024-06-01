### Public Subnets ###

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  count                   = length(var.public_cidr_blocks)
  cidr_block              = var.public_cidr_blocks[count.index]
  availability_zone       = local.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(var.common_tags, var.public_subnet_tags, {
    Name = "${var.project_name}-${var.environment}-subnet-public${count.index + 1}-${local.availability_zones[count.index]}"
  })
}

### Private Subnets ###

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.private_cidr_blocks)
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = local.availability_zones[count.index]

  tags = merge(var.common_tags, var.private_subnet_tags, {
    Name = "${var.project_name}-${var.environment}-subnet-private${count.index + 1}-${local.availability_zones[count.index]}"
  })
}

### Database Subnets ###

resource "aws_subnet" "database" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.database_cidr_blocks)
  cidr_block        = var.database_cidr_blocks[count.index]
  availability_zone = local.availability_zones[count.index]

  tags = merge(var.common_tags, var.database_subnet_tags, {
    Name = "${var.project_name}-${var.environment}-subnet-database${count.index + 1}-${local.availability_zones[count.index]}"
  })
}

### Database Subnet Group ###
resource "aws_db_subnet_group" "this" {
  subnet_ids = aws_subnet.database[*].id # list of IDs

  tags = merge(var.common_tags, var.database_subnet_group_tags, {
    Name = "${var.project_name}-${var.environment}-database-group"
  })
}