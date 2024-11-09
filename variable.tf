variable "environment" {
  description = "TAG para definir qual ambiente sera provisionado"
  default     = "production"
  type        = string
}

variable "default_vpc" {
  description = "Nome da VPC padrao da conta"
  default     = ["vpc-andreazi"]
  type        = list(string)
}

variable "public_subnets" {
  description = "Subnets publicas"
  default     = ["Public-Subnet-*"]
  type        = list(string)
}

variable "projeto" {
  description = "Nome padrao do projeto"
  default     = "andreazi"
  type        = string
}

variable "aws_andreazi" {
  description = "Dominio padrao hospedado na AWS"
  default     = "aws.andreazi.com"
  type        = string
}

variable "erik" {
  description = "IP publico de casa"
  default     = ["45.230.103.152/32"]
  type        = list(string)
}

variable "tg_default_action" {
  description = "Regra padrao dos listeners"
  default     = ["text/plain", "Access Denied", "403"]
  type        = list(string)
}