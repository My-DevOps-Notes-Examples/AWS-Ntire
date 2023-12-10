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