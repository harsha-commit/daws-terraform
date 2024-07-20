resource "aws_subnet" "public" {
  count  = length(var.public_subnets)
  vpc_id = aws_vpc.main.id

  availability_zone = local.availability_zones[count.index]
  cidr_block        = var.public_subnets[count.index]

  tags = merge(local.common_tags, var.subnet_tags, {
    Name = "${var.project_name}-${var.environment}-public-subnet-${local.availability_zones[count.index]}"
  })
}

resource "aws_subnet" "private" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.main.id

  availability_zone = local.availability_zones[count.index]
  cidr_block        = var.private_subnets[count.index]

  tags = merge(local.common_tags, var.subnet_tags, {
    Name = "${var.project_name}-${var.environment}-private-subnet-${local.availability_zones[count.index]}"
  })
}

resource "aws_subnet" "database" {
  count  = length(var.database_subnets)
  vpc_id = aws_vpc.main.id

  availability_zone = local.availability_zones[count.index]
  cidr_block        = var.database_subnets[count.index]

  tags = merge(local.common_tags, var.subnet_tags, {
    Name = "${var.project_name}-${var.environment}-database-subnet-${local.availability_zones[count.index]}"
  })
}
