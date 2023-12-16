variable "region" {
  type        = string
  default     = "us-east-1"
  description = "location to create resource"
}

variable "ntier_vpc_info" {
  type = object({
    vpc_name        = string
    vpc_cidr        = string
    subnets_names   = list(string)
    subnets_azs     = list(string)
    igw_name        = string
    private_subnets = list(string)
    public_subnets  = list(string)
  })
  default = {
    vpc_name        = "ntier"
    vpc_cidr        = "192.168.0.0/16"
    subnets_names   = ["app1", "app2", "db1", "db2"]
    subnets_azs     = ["a", "b", "a", "b"]
    igw_name        = "ntier-igw"
    private_subnets = ["app1", "app2", "db1", "db2"]
    public_subnets  = []
  }
}

variable "security_group" {
  type = object({
    name        = string
    port_number = number
    protocol    = string
    description = string
  })
  default = {
    name        = "mysql"
    port_number = 3306
    protocol    = "tcp"
    description = "allows mysql"
  }
}