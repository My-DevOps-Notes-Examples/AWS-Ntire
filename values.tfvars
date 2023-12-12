region = "us-east-2"
ntier_vpc_info = {
  vpc_cidr      = "10.100.0.0/16"
  subnets_names = ["app1", "app2", "db1", "db2"]
  subnets_azs   = ["a", "b", "a", "b"]
}