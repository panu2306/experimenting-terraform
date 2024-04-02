provider "aws" {
  region = "us-west-1"
}

locals {
  common_tags = {
    owner   = "DevOps Team"
    service = "Backend Server"
  }
  time = formatdate("EEEE, DD-MMM-YY hh:mm:ss ZZZ", timestamp())
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = lookup(var.ami_list, var.regions[2])
  instance_type = "t2.micro"

  count = 2

  tags = (merge(
    local.common_tags,
    { "Name" = "EC2-${count.index}" }
  ))
}

resource "aws_instance" "data_source_ec2" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
}

output "time_created" {
  value = local.time
}
