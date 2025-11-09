# Outputs for the infrastructure, what you see at the end.

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.alex_vpc_v3.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = aws_subnet.alex_subnet_v3.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.alex_instance_v3.public_ip
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.alex_sg_v3.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.alex_instance_v3.id
}

output "route_table_id" {
  description = "The ID of the Route Table"
  value       = aws_route_table.alex_route_table_v3.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.alex_igw_v3.id
}

output "region" {
  description = "The AWS region where resources are deployed"
  value       = var.region
}

output "public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.alex_instance_v3.public_dns
}

output "availability_zone" {
  description = "The availability zone of the subnet"
  value       = aws_subnet.alex_subnet_v3.availability_zone
}
