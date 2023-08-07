resource "aws_instance" "example_instance" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.s3_session_manager_instance_profile.name
  tags = {
    Name = "S3-test-ec2"
  }
  key_name = "lenovo"
}
