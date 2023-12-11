resource "aws_vpc" "ntier" {
  cidr_block = var.ntier-vpc-range

  tags = {
    Name = "ntier"
  }
}

resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.app1-cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "app1"
  }

  depends_on = [
    aws_vpc.ntier
  ]
}

resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.app2-cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "app2"
  }

  depends_on = [
    aws_vpc.ntier
  ]
}

resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.db1-cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "db1"
  }

  depends_on = [
    aws_vpc.ntier
  ]
}

resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.db2-cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "db2"
  }

  depends_on = [
    aws_vpc.ntier
  ]
}