provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "nginx_server" {
  instance_type   = "t2.micro"
  ami             = "ami-05c969369880fa2c2"
  key_name        = "terraform-key"
  security_groups = ["ec2-sg"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "Allow certain inbound traffic and all outbound traffic"
}

variable "ports" {
  type = list(string)
  default = ["22", "80"]
}

variable "cidr_block" {
  default = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "inbound" {
  security_group_id = aws_security_group.ec2-sg.id
  cidr_ipv4         = var.cidr_block
  from_port         = var.ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.ports[count.index]
  count = 2
}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.ec2-sg.id
  cidr_ipv4         = var.cidr_block
  ip_protocol       = "-1" # semantically equivalent to all ports
}

