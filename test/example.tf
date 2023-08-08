resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  tags = {
    #Name = "ansible-${count.index}" 
    #Name = var.instance_name
  }
  key_name = "lenovo"
}
    output "ansible-servers" {
      value = [aws_instance.example[*].public_ip]
    }
