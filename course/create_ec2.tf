provider "aws" {
	region     = "us-west-1"
}

locals {
	common_tags = {
		owner 	= "DevOps Team"
		service = "Backend Server"
	}
	time = formatdate("EEEE, DD-MMM-YY hh:mm:ss ZZZ", timestamp())
}

resource "aws_instance" "my_ec2" {
	ami 		= "${lookup(var.ami_list, var.regions[2])}"
	instance_type   = "t2.micro"
	
	count = 2

	tags = "${merge(
		local.common_tags, 
		{"Name" = "EC2-${count.index}"}
	)}"
}


output "time_created" {
	value = local.time
}
