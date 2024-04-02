resource "aws_security_group" "sg-01" {
  name        = "my-sg"
  description = "Sample security group to define values of ports using local"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg-01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = local.ssh_port
  ip_protocol       = "tcp"
  to_port           = local.ssh_port
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg-01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = local.http_port
  ip_protocol       = "tcp"
  to_port           = local.http_port
}


resource "aws_vpc_security_group_egress_rule" "allow_all_egress_traffic" {
  security_group_id = aws_security_group.sg-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

locals {
  ssh_port  = 22
  http_port = 80
}


output "sg_name" {
	value = aws_security_group.sg-01.name
}
