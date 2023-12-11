variable "region" {
  type        = string
  default     = "us-east-1"
  description = "location to create resource"
}

variable "ntier-vpc-range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "VPC CIDR range"
}

variable "subnets-cidr" {
  type    = list(string)
  default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

variable "subnets-azs" {
  type    = list(string)
  default = ["a", "b", "a", "b"]
}

variable "subnets-names" {
  type    = list(string)
  default = ["app1", "app2", "db1", "db2"]
}