resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.frontend_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.public_subnet_ids.value)

  tags = merge(var.common_tags, var.frontend_alb_tags, {
    Name      = "${var.project_name}-${var.environment}-frontend-alb",
    Component = "frontend-alb"
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>This is Fixed response from HTTP</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"

  certificate_arn = data.aws_ssm_parameter.certificate_arn.value

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>This is Fixed response from HTTPS</h1>"
      status_code  = "200"
    }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name            = "web-${var.environment}" # name.zone_name
      type            = "A"
      allow_overwrite = true
      alias = {
        name    = aws_lb.main.dns_name
        zone_id = aws_lb.main.zone_id
      }
    },
  ]

}
