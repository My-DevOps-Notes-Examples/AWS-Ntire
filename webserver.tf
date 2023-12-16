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

resource "aws_instance" "web" {
  ami                         = data.aws_ami_ids.ubuntu_2204.ids[0]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.webserver.id]
  subnet_id                   = data.aws_subnet.web.id

  tags = {
    Name = "webserver"
  }

  depends_on = [
    aws_security_group.webserver,
    aws_db_instance.emp_database
  ]
}