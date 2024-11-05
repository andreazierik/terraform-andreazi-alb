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

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_lb.example_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.deny_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.aws_alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.aws_alb_sg_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.aws_alb_sg_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_andreazi"></a> [aws\_andreazi](#input\_aws\_andreazi) | Dominio padrao hospedado na AWS | `string` | `"aws.andreazi.com"` | no |
| <a name="input_default_vpc"></a> [default\_vpc](#input\_default\_vpc) | Nome da VPC padrao da conta | `list(string)` | <pre>[<br/>  "vpc-andreazi"<br/>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | TAG para definir qual ambiente sera provisionado | `string` | `"production"` | no |
| <a name="input_erik"></a> [erik](#input\_erik) | IP publico de casa | `list(string)` | <pre>[<br/>  "45.230.103.152/32"<br/>]</pre> | no |
| <a name="input_projeto"></a> [projeto](#input\_projeto) | Nome padrao do projeto | `string` | `"andreazi"` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Subnets publicas | `list(string)` | <pre>[<br/>  "Public-Subnet-*"<br/>]</pre> | no |
<!-- END_TF_DOCS -->