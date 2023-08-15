resource "aws_autoscaling_group" "aws-tf" {
  name = "aws-tf-auto-scaling-group"
  launch_template {
    id = aws_launch_template.web.id
  }
  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 1
  health_check_type         = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier       = ["subnet-0636b1f38252db177"]

  tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }
}
