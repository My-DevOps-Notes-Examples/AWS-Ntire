resource "aws_vpc" "ntier" {
  cidr_block = var.ntier-vpc-range

  tags = {
    Name = "ntier"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.subnets-names)
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.subnets-cidr[count.index]
  availability_zone = "${var.region}${var.subnets-azs[count.index]}"

  tags = {
    Name = var.subnets-names[count.index]
  }

  depends_on = [
    aws_vpc.ntier
  ]
}