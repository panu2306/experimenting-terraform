resource "aws_instance" "my-ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.public_subnet_id
  tags                   = local.ec2_tags

}

locals {
  ec2_tags = {
    Name = "EC2-Server"
    Env  = "Dev"
  }
}
