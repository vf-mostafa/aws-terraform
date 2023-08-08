data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Amazon Linux*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
}
  filter {  
    name   = "architecture"
    values = ["x86"]
  }

#  owners = ["099720109477"] # Canonical
}

output "ami-id" {
  value = [data.aws_ami.ubuntu.id]
}
