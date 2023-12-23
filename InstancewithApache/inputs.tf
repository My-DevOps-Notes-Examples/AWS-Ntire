variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_info" {
  type = object({
    vpc_cidr     = string
    vpc_name     = string
    subnet_names = list(string)
    subnets_azs  = list(string)
    igw_name     = string
  })
  default = {
    vpc_cidr     = "192.168.0.0/16"
    vpc_name     = "appserver-vpc"
    subnet_names = ["app1", "app2", "web1", "web2"]
    subnets_azs  = ["a", "b", "a", "b"]
    igw_name     = "appserver-igw"
  }
}