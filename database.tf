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

resource "aws_db_instance" "emp_database" {
  allocated_storage      = 20
  db_name                = var.database_info.db_name
  db_subnet_group_name   = aws_db_subnet_group.ntier_db.name
  engine                 = var.database_info.db_engine
  engine_version         = var.database_info.db_engine_version
  instance_class         = var.database_info.db_instance_class
  username               = "sureshkola"
  password               = "Satish3697"
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.mysql.id]

  tags = {
    Name = var.database_info.db_name
  }

  depends_on = [
    aws_db_subnet_group.ntier_db,
    aws_security_group.mysql
  ]
}