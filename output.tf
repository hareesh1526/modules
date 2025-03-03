output "public_ip" {
  value       = aws_instance.my_ec2.public_ip
}

output "private_ip" {
    value = aws_instance.my_ec2.private_ip
}

output "my_ec2" {
    value = aws_instance.my_ec2.ami_id
}