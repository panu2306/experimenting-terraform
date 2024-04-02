resource "aws_instance" "my-ec2" {
  ami             = "ami-05c969369880fa2c2"
  instance_type   = var.instance_type
  security_groups = var.security_groups
}
