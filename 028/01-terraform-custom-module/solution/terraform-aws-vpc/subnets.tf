resource "aws_subnet" "public" {
  count  = length(var.public_subnets)
  vpc_id = aws_vpc.main.id

  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.common_tags, var.subnet_tags, {
    Name = "${var.project_name}-${var.environment}-subnet-public-${var.availability_zones[count.index]}"
  })
}

resource "aws_subnet" "private" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.main.id

  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.common_tags, var.subnet_tags, {
    Name = "${var.project_name}-${var.environment}-subnet-private-${var.availability_zones[count.index]}"
  })
}

resource "aws_subnet" "database" {
  count  = length(var.database_subnets)
  vpc_id = aws_vpc.main.id

  cidr_block        = var.database_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.common_tags, var.subnet_tags, {
    Name = "${var.project_name}-${var.environment}-subnet-database-${var.availability_zones[count.index]}"
  })
}
