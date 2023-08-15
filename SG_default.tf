resource "aws_default_vpc" "default" {
  #  tags = {
  #    name = "default"
  #  }
}
output "vpc_id" {
  value = aws_default_vpc.default.id
}
output "cidr_block" {
  value = aws_default_vpc.default.cidr_block
}
resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol    = 6
    self        = true
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = 6
    self        = true
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
