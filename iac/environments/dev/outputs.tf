output "vpc_availability_zones" {
  description = "Availability zone for the VPC"
  value       = module.vpc.availability_zones
}

output "vpc_public_subnets_cidr" {
  description = "CIDR block for the public subnet"
  value       = module.vpc.public_subnets_cidr
}

output "vpc_private_subnets_cidr" {
  description = "CIDR block for the private subnet"
  value       = module.vpc.private_subnets_cidr
}

output "vpc_database_subnets_cidr" {
  description = "CIDR block for the database subnet"
  value       = module.vpc.database_subnets_cidr
}

output "bastion_hostname" {
  description = "DNS name of the bastion host"
  value       = module.vpc.bastion_hostname
}

output "internal_host_ip" {
  description = "IP of the host deployed to private subnet"
  value       = module.vpc.internal_host_ip
}


