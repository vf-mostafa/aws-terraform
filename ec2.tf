resource "aws_instance" "Dev_instance" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.s3_session_manager_instance_profile.name
  tags = {
    Name = "Dev-ec2"
  }
  key_name = "lenovo"
  user_data = base64encode(file("page.sh"))
}
#resource "aws_instance" "Prod_instance" {
#  ami           = "ami-0f34c5ae932e6f0e4"
#  instance_type = "t2.micro"
#
#  iam_instance_profile = aws_iam_instance_profile.s3_session_manager_instance_profile.name
#  tags = {
#    Name = "Prod-ec2"
# 
#  }
#  key_name = "lenovo"
#  user_data = "aws s3 cp  s3://my-s3-bucket.aws-terraform-practice-1/index.html  /var/www/html/ "
#  
#}
