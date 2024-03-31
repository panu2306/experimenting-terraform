provider "aws" {
	region     = "us-west-1"
}

locals {
	common_tags = {
		owner 	= "DevOps Team"
		service = "Backend Server"
	}
}

resource "aws_instance" "my_first_ec2" {
	ami 		= "ami-05c969369880fa2c2"
	instance_type   = "t2.micro"
	
	tags = local.common_tags
}

output "ec2_info" {
	value = aws_instance.my_first_ec2
}

output "ec2_ip_dns" {
	value = "DNS: ${aws_instance.my_first_ec2.public_dns} and IP: ${aws_instance.my_first_ec2.public_ip}"
}
