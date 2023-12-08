provider "aws" {
  
}

resource "aws_vpc" "ntier" {
  cidr_block = "198.162.0.0/16"

  tags = {
    Name = "ntier"
  }
}