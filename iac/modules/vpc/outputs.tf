output "bastion_hostname" {
  description = "DNS name of the bastion host"
  value       = "ec2-user@${aws_instance.a4l_bastion[0].public_dns}"
}

output "internal_host_ip" {
  description = "IP of the host deployed to private subnet"
  value       = "ec2-user@${aws_instance.a4l_internal[0].private_ip}"
}

output "availability_zones" {
  description = "Availability zones for the VPC"
  value       = local.azs
}

output "public_subnets_cidr" {
  description = "IPs of the public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets_cidr" {
  description = "IPs of the public subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "database_subnets_cidr" {
  description = "IPs of the public subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}
