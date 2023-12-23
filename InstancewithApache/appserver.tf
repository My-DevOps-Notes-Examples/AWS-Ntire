resource "aws_security_group" "appserver_sg" {
  name        = var.server_security_group.name
  description = var.server_security_group.description
  vpc_id      = aws_vpc.appserver-vpc.id
  ingress {
    from_port   = var.server_security_group.port_80
    to_port     = var.server_security_group.port_80
    protocol    = var.server_security_group.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.server_security_group.port_22
    to_port     = var.server_security_group.port_22
    protocol    = var.server_security_group.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.server_security_group.name
  }

  depends_on = [
    aws_vpc.appserver-vpc
  ]
}