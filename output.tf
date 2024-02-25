output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "number_of_zones" {
  value = length(data.aws_availability_zones.available.names)
}

output "public_instance_ips" {
  value       = aws_instance.public[*].public_ip
  description = "Public IPs of all public instances"
}

output "private_instance_ips" {
  value       = aws_instance.private[*].private_ip
  description = "Private IPs of all private instances"
}


