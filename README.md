<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.74 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.74 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_subnets.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpcs.default_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_vpc"></a> [default\_vpc](#input\_default\_vpc) | Nome da VPC padrao da conta | `list(string)` | <pre>[<br/>  "vpc-andreazi"<br/>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | TAG para definir qual ambiente sera provisionado | `string` | `"production"` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Subnets publicas | `list(string)` | <pre>[<br/>  "Public-Subnet-*"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_subnets"></a> [aws\_subnets](#output\_aws\_subnets) | n/a |
| <a name="output_aws_vpcs"></a> [aws\_vpcs](#output\_aws\_vpcs) | n/a |
<!-- END_TF_DOCS -->

# Infrastructure Diagram
Para ver o diagrama de infraestrutura, [clique aqui](DIAGRAM.md).