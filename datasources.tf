data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.private_subnets
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.public_subnets
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "db_subnets" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.db_subnets
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_ami_ids" "ubuntu_2204" {
  owners = ["099720109477"]
  filter {
    name   = "description"
    values = ["Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-09-19"]
  }
  filter {
    name   = "is-public"
    values = ["true"]
  }
}

data "aws_subnet" "web" {
  filter {
    name   = "tag:Name"
    values = [var.ntier_vpc_info.web_subnet]
  }

  depends_on = [
    aws_subnet.subnets
  ]
}