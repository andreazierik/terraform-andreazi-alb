resource "aws_security_group" "aws_alb_sg" {
  name   = "${var.projeto}-${var.environment}-alb-sg"
  vpc_id = data.aws_vpcs.default_vpc.id[0]

  tags = {
    Name = "${var.projeto}-${var.environment}-alb-sg"
  }
}

resource "aws_security_group_rule" "aws_alb_sg_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.erik
  security_group_id = aws_security_group.aws_alb_sg.id
}

resource "aws_security_group_rule" "aws_alb_sg_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.erik
  security_group_id = aws_security_group.aws_alb_sg.id
}

# Defina o ALB
resource "aws_lb" "example_alb" {
  name               = "${var.projeto}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws_alb_sg.id]
  subnets            = data.aws_subnets.public_subnets.ids[*]

  enable_deletion_protection = false

  tags = {
    Name = "${var.projeto}-${var.environment}-alb"
  }
}

resource "aws_lb_target_group" "deny_tg" {
  name        = "${var.projeto}-deny"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpcs.default_vpc.id[0]
  target_type = "ip"

  health_check {
    enabled = false
  }
}

# Listener na porta 80 que redireciona para a regra 403
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Access Denied"
      status_code  = "403"
    }
  }
}

# Listener na porta 443 que redireciona para a regra 403
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Access Denied"
      status_code  = "403"
    }
  }
}