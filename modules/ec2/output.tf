#Return is of the instance
output "ec2_id" {
    value = aws_instance.myec2.id
}

#Return Public IP
output "ec2_public_ip" {
    value = aws_instance.myec2.public_ip
}
