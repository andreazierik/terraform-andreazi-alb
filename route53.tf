resource "aws_route53_record" "ecs_route53" {
  zone_id = data.aws_route53_zone.aws_andreazi.zone_id
  name    = "pdf.${var.aws_andreazi}"
  type    = "A"

  alias {
    name                   = aws_lb.example_alb.dns_name
    zone_id                = aws_lb.example_alb.zone_id
    evaluate_target_health = true
  }
}