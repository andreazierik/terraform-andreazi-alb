variable "environment" {
  description = "TAG para definir qual ambiente sera provisionado"
  default = "production"
  type = string
}

variable "default_vpc" {
  description = "Nome da VPC padrao da conta"
  default = "vpc-andreazi"
  type = string
}

variable "public_subnets" {
  description = "Subnets publicas"
  default = ["Public-Subnet-*"]
  type = string
}