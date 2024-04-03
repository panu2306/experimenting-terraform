output "arn" {
  value = aws_instance.my-ec2.arn
}

output "public_dns" {
  value = aws_instance.my-ec2.public_dns
}

output "public_ip" {
  value = aws_instance.my-ec2.public_ip
}
