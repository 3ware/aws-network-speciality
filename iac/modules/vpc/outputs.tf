output "bastion_hostname" {
  description = "DNS name of the bastion host"
  # host creation is conditional based on the presence of var.ssk_key
  # if the key is provided the host is created and the value is: aws_instance.a4l_bastion[0].public_dns
  # if the key is not provided the host is not created and the value is: null
  # the one function will return the first element of the list or null if the list is empty
  # i.e if the resource is created, so is the output and vice versa. Without this the configuration is invalid
  value = one(aws_instance.a4l_bastion[*].public_dns)
}

output "internal_host_ip" {
  description = "IP of the host deployed to private subnet"
  value       = one(aws_instance.a4l_internal[*].private_ip)
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
