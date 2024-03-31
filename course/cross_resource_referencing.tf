/*
resource "aws_eip" "my_eip" {
	domain 	= "vpc"
}


resource "aws_security_group" "allow_http_traffic" {
	name	= "attribute-sg"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_traffic" {
	security_group_id 	= aws_security_group.allow_http.id
	cidr_ipv4 		= "${aws_eip.my_eip.public_ip}/32"
	from_port 		= 80
	ip_protocol 		= "tcp"
	to_port 		= 80
}

*/
