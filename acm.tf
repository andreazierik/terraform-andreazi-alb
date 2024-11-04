resource "aws_acm_certificate" "cert" {
  domain_name       = var.aws_andreazi
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${var.aws_andreazi}"
  ]

  tags = {
    Name = "${var.projeto}-default-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.aws_andreazi.zone_id

  depends_on = [data.aws_route53_zone.aws_andreazi, aws_acm_certificate.cert]
}