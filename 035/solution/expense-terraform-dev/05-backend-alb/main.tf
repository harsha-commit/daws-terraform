resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.backend_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_ids.value)

  tags = merge(var.common_tags, var.backend_alb_tags, {
    Name      = "${var.project_name}-${var.environment}-backend-alb",
    Component = "backend-alb"
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
      message_body = "<h1>This is Fixed response from Backend ALB</h1>"
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
      name            = "*.app-${var.environment}" # db.zone_name
      type            = "A"
      allow_overwrite = true
      alias = {
        name    = aws_lb.main.dns_name
        zone_id = aws_lb.main.zone_id
      }
    },
  ]

}

