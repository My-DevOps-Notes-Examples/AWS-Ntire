variable "region" {
  type        = string
  default     = "us-east-1"
  description = "location to create resource"
}

variable "ntier_vpc_info" {
  type = object({
    vpc_cidr      = string
    subnets_names = list(string)
    subnets_azs   = list(string)
  })
  default = {
    vpc_cidr      = "192.168.0.0/16"
    subnets_names = ["app1", "app2", "db1", "db2"]
    subnets_azs   = ["a", "b", "a", "b"]
  }
}