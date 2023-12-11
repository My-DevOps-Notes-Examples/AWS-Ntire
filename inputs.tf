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

variable "app1-cidr" {
  type    = string
  default = "192.168.0.0/24"
}

variable "app2-cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "db1-cidr" {
  type    = string
  default = "192.168.2.0/24"
}

variable "db2-cidr" {
  type    = string
  default = "192.168.3.0/24"
}