data "aws_vpcs" "default_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.default_vpc]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnets]
  }
}