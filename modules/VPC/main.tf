resource "aws_vpc" "npd_vpc" {
  cidr_block           = var.cidr_block_range
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "npd-vpc"
  }
}

resource "aws_internet_gateway" "npd_IGW" {
  vpc_id = aws_vpc.npd_vpc.id
}

locals {
  azs = data.aws_availability_zones.available.names
}

resource "aws_subnet" "PublicSubnets" {
  count = 4
  #count            = length(var.cidr_subnet_range)
  #count            = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.npd_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.npd_vpc.cidr_block, 9, count.index)
  availability_zone = local.azs[count.index % length(local.azs)]

  tags = {
    Name = "Public Subnet-${count.index}"
  }
}

resource "aws_subnet" "PrivateSubnets" {
  count             = 4
  vpc_id            = aws_vpc.npd_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.npd_vpc.cidr_block, 9, count.index + 4)
  availability_zone = local.azs[count.index % length(local.azs)]

  tags = {
    Name = "Private Subnet-${count.index}"
  }
}

resource "aws_route_table" "PublicRoutTable" {
  vpc_id = aws_vpc.npd_vpc.id

  route {
    cidr_block = var.cidr_block_route
    gateway_id = aws_internet_gateway.npd_IGW.id
  }

  tags = {
    Name = " Public Route Table "
  }

}

resource "aws_route_table" "PrivateRoutTable" {
  vpc_id = aws_vpc.npd_vpc.id

  tags = {
    Name = " Private Route Table "
  }

}

resource "aws_route_table_association" "Public_RTA" {
  count          = length(aws_subnet.PublicSubnets)
  route_table_id = aws_route_table.PublicRoutTable.id
  subnet_id      = aws_subnet.PublicSubnets[count.index].id

  depends_on = [aws_subnet.PublicSubnets]
}

resource "aws_route_table_association" "Private_RTA" {
  count          = length(aws_subnet.PrivateSubnets)
  route_table_id = aws_route_table.PrivateRoutTable.id
  subnet_id      = aws_subnet.PrivateSubnets[count.index].id

  depends_on = [aws_subnet.PrivateSubnets]

}


