resource "aws_security_group" "mysql" {
  name        = var.security_group.name
  description = var.security_group.description
  ingress {
    from_port   = var.security_group.port_number
    to_port     = var.security_group.port_number
    protocol    = var.security_group.protocol
    cidr_blocks = [var.ntier_vpc_info.vpc_cidr]
  }
  vpc_id = aws_vpc.ntier.id

  tags = {
    Name = var.security_group.name
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_db_subnet_group" "ntier_db" {
  name       = var.database_info.db_subnet_group_name
  subnet_ids = data.aws_subnets.db_subnets.ids

  tags = {
    Name = var.database_info.db_subnet_group_name
  }

  depends_on = [
    aws_subnet.subnets
  ]
}