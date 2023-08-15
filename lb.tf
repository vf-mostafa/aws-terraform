resource "aws_lb" "aws-tf" {
  name               = "aws-tf-alb"
  internal           = false
  load_balancer_type = "application"

  subnets = ["subnet-0636b1f38252db177","subnet-06cb250faa2ecbb6b"]
}

resource "aws_lb_target_group" "lb-tf" {
  name        = "aws-tf-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_default_vpc.default.id
  target_type = "instance"
}

resource "aws_lb_listener" "aws-tf" {
  load_balancer_arn = aws_lb.aws-tf.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.lb-tf.arn
    type             = "forward"
  }
}

resource "aws_autoscaling_attachment" "lb-tf" {
  autoscaling_group_name = aws_autoscaling_group.aws-tf.name
  lb_target_group_arn    = aws_lb_target_group.lb-tf.arn
}
output "aws_lb_dns_name" {
  value = aws_lb.aws-tf.dns_name
}
