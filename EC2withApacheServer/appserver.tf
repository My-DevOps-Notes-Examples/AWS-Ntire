resource "aws_security_group" "appserver_sg" {
  name        = var.server_security_group.name
  description = var.server_security_group.description
  vpc_id      = aws_vpc.appserver-vpc.id
  ingress {
    from_port   = var.server_security_group.port_80
    to_port     = var.server_security_group.port_80
    protocol    = var.server_security_group.protocol
    cidr_blocks = [var.vpc_info.vpc_cidr]
  }
  ingress {
    from_port   = var.server_security_group.port_22
    to_port     = var.server_security_group.port_22
    protocol    = var.server_security_group.protocol
    cidr_blocks = [var.vpc_info.vpc_cidr]
  }

  tags = {
    Name = var.server_security_group.name
  }

  depends_on = [
    aws_vpc.appserver-vpc
  ]
}