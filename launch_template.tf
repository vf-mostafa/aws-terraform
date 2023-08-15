resource "aws_launch_template" "web" {
  name          = "web"
  image_id      = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  key_name      = "lenovo"
  iam_instance_profile {
    name = aws_iam_instance_profile.s3_session_manager_instance_profile.name
  }
  #vpc_security_group_ids = ["sg-049c78e5555520337"]
  user_data = base64encode(file("html.sh"))
  #user_data = base64encode(<<EOF
  #echo "<html><h1>Let\'s understand the implementation of ELB and Auto Scaling services</h1></html>" > /var/www/html/index.html

  #EOF
  #  )
  network_interfaces {
    security_groups = ["sg-049c78e5555520337"]
    subnet_id       = "subnet-0636b1f38252db177"
  }
}
