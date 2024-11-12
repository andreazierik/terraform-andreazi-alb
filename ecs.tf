resource "aws_security_group" "aws_ecs_sg" {
  name        = "${var.projeto}-${var.environment}-ecs-sg"
  vpc_id      = data.aws_vpcs.default_vpc.ids[0]
  description = "Allow HTTP and HTTPS traffic"

  tags = {
    Name = "${var.projeto}-${var.environment}-ecs-sg"
  }
}

resource "aws_security_group_rule" "aws_ecs_sg_http" {
  description       = "Allow HTTP"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id   = aws_security_group.aws_alb_sg.id
  security_group_id = aws_security_group.aws_ecs_sg.id
}

resource "aws_security_group_rule" "aws_ecs_sg_https" {
  description       = "Allow HTTPS"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id   = aws_security_group.aws_alb_sg.id
  security_group_id = aws_security_group.aws_ecs_sg.id
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.projeto}-${var.environment}-ecs-cluster"
}

resource "aws_lb_target_group" "ecs_tg" {
  name     = "${var.projeto}-${var.environment}-ecs-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpcs.default_vpc.ids[0]

  health_check {
    enabled             = true
    path                = "/"
    matcher             = "200-299"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "ecs_alb_rule" {
  listener_arn = aws_lb_listener.https_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }

  condition {
    host_header {
      values = ["pdf.${var.aws_andreazi}"]
    }
  }
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "ecs-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "${var.projeto}-${var.environment}-pdf"
    image     = "frooodle/s-pdf:latest"
    essential = true
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
  }])
}

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.projeto}-${var.environment}-pdf-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = data.aws_subnets.public_subnets.ids[*]
    security_groups  = [aws_security_group.aws_ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "${var.projeto}-${var.environment}-pdf-container"
    container_port   = 80
  }

  desired_count = 1
}