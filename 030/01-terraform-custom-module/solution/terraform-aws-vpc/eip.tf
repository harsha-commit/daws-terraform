### Elastic IP ###

resource "aws_eip" "this" {
  domain = "vpc"
  tags = merge(var.common_tags, var.eip_tags, {
    Name = "${var.project_name}-${var.environment}-eip"
  })
}