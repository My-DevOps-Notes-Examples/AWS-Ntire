resource "aws_vpc" "appserver-vpc" {
  cidr_block = var.vpc_info.vpc_cidr

  tags = {
    Name = var.vpc_info.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.vpc_info.subnet_names)
  vpc_id            = aws_vpc.appserver-vpc.id
  cidr_block        = cidrsubnet(var.vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.vpc_info.subnets_azs[count.index]}"

  tags = {
    Name = var.vpc_info.subnet_names[count.index]
  }

  depends_on = [
    aws_vpc.appserver-vpc
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.appserver-vpc.id

  tags = {
    Name = var.vpc_info.igw_name
  }
}