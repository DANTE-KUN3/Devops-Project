output "instance_id" {
    value       = aws_instance.new.id
    description = "The ID of the EC2 instance created by the module"
  
}
output "instance_public_ip" {
    value = aws_instance.new.public_ip
    description = "The public IP address of the EC2 instance created by the module"
}