provider "aws" {
	region     = "us-west-1"
}

resource "aws_instance" "my_first_ec2" {
	ami 		= "ami-05c969369880fa2c2"
	instance_type   = "t2.micro"
	
	tags = {
		Name = "EC2-01"
	}
}
