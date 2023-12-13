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