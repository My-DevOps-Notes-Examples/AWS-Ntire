resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "allow ssh & http"
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = [var.ntier_vpc_info.vpc_cidr]
  }
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = [var.ntier_vpc_info.vpc_cidr]
  }
  vpc_id = aws_vpc.ntier.id

  tags = {
    Name = "webserver"
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

