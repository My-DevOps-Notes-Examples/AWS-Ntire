resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_info.vpc_cidr

  tags = {
    Name = var.ntier_vpc_info.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.ntier_vpc_info.subnets_names)
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = cidrsubnet(var.ntier_vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.ntier_vpc_info.subnets_azs[count.index]}"

  tags = {
    Name = var.ntier_vpc_info.subnets_names[count.index]
  }

  depends_on = [
    aws_vpc.ntier
  ]
}

resource "aws_internet_gateway" "ntier_igw" {
  vpc_id = local.vpc_id

  tags = {
    Name = "ntier-igw"
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_route_table" "private" {
  vpc_id = local.vpc_id

  tags = {
    Name = "private"
  }

  depends_on = [
    aws_subnet.subnets,
    aws_internet_gateway.ntier_igw
  ]
}

resource "aws_route_table" "public" {
  vpc_id = local.vpc_id
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.ntier_igw.id
  }

  tags = {
    Name = "public"
  }

  depends_on = [
    aws_internet_gateway.ntier_igw
  ]
}

resource "aws_route_table_association" "private_association" {
  count          = length(data.aws_subnets.private.ids)
  subnet_id      = data.aws_subnets.private.ids[count.index]
  route_table_id = aws_route_table.private.id

  depends_on = [
    aws_subnet.subnets,
    aws_route_table.private
  ]
}

resource "aws_route_table_association" "public_association" {
  count          = length(data.aws_subnets.public.ids)
  subnet_id      = data.aws_subnets.public.ids[count.index]
  route_table_id = aws_route_table.public.id

  depends_on = [
    aws_subnet.subnets,
    aws_route_table.public
  ]
}