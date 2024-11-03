output "aws_vpcs" {
    value = data.aws_vpcs.default_vpc.ids[*]
}

output "aws_subnets" {
  value = data.aws_subnets.public_subnets.ids[*]
}