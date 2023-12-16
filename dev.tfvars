region = "us-east-2"
ntier_vpc_info = {
  vpc_name        = "ntier"
  vpc_cidr        = "10.100.0.0/16"
  subnets_names   = ["app1", "app2", "db1", "db2", "web1", "web2"]
  subnets_azs     = ["a", "b", "a", "b", "a", "b"]
  igw_name        = "ntier-igw"
  private_subnets = ["app1", "app2", "db1", "db2"]
  public_subnets  = ["web1", "web2"]
  db_subnets      = ["db1", "db2"]
}
mysql_security_group = {
  name        = "mysql"
  port_number = 3306
  protocol    = "tcp"
  description = "allows mysql"
}
database_info = {
  db_subnet_group_name = "ntier-db"
  db_name              = "sureshempdatabase"
  db_engine            = "mysql"
  db_engine_version    = "8.0.33"
  db_instance_class    = "db.t3.micro"
}