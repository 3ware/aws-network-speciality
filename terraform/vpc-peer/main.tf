module "vpc" {
  for_each = var.vpc
  source   = "terraform-aws-modules/vpc/aws"
  version  = "~> 3.14.0"

  name = each.key

  cidr            = each.value.cidr
  azs             = each.value.azs
  private_subnets = each.value.private_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "endpoints" {
  for_each = var.vpc
  source   = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version  = "~> 3.14.0"

  vpc_id = module.vpc[each.key].vpc_id

  endpoints = {
    ssm = {
      service             = "ssm"
      private_dns_enabled = true
      subnet_ids          = module.vpc[each.key].private_subnets
      #security_group_ids  = 
    },
    ssmmessages = {
      service             = "ssmmessages"
      private_dns_enabled = true
      subnet_ids          = module.vpc[each.key].private_subnets
      #security_group_ids  = 
    },
    ec2messages = {
      service             = "ec2messages"
      private_dns_enabled = true
      subnet_ids          = module.vpc[each.key].private_subnets
      #security_group_ids  =
    },
  }
}




# resource "aws_security_group_rule" "" {
#   description       = "Inbound traffic to bastion hosts"
#   type              = "ingress"
#   from_port         = local.admin_port
#   to_port           = local.admin_port
#   protocol          = "tcp"
#   security_group_id = aws_security_group.bastion.id
#   cidr_blocks       = var.trusted_ips
# }

# resource "aws_security_group_rule" "bastion_egress" {
#   description       = "Outbound traffic private subnets"
#   type              = "egress"
#   from_port         = local.admin_port
#   to_port           = local.admin_port
#   protocol          = "tcp"
#   security_group_id = aws_security_group.bastion.id
#   cidr_blocks       = module.vpc.private_subnets_cidr_blocks
# }

# resource "aws_security_group" "bastion" {
#   name        = "A4L-BASTION"
#   description = "Security Group for A4L Bastion Host"
#   vpc_id      = module.vpc.vpc_id

#   tags = {
#     Name = "A4L-BASTION"
#   }
# }

# resource "aws_security_group_rule" "internal_ingress" {
#   description              = "Inbound traffic to internal hosts"
#   type                     = "ingress"
#   from_port                = local.admin_port
#   to_port                  = local.admin_port
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.internal.id
#   source_security_group_id = aws_security_group.bastion.id
# }

# resource "aws_security_group_rule" "internal_egress" {
#   description       = "Outbound traffic from internal hosts"
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = -1
#   security_group_id = aws_security_group.internal.id
#   cidr_blocks       = ["0.0.0.0/0"] #! tfsec:ignore:aws-vpc-no-public-egress-sgr
# }

# resource "aws_security_group" "internal" {
#   name        = "A4L-INTERNAL"
#   description = "Security Group for A4L internal Host"
#   vpc_id      = module.vpc.vpc_id

#   tags = {
#     Name = "A4L-INTERNAL"
#   }
# }

# #! tfsec:ignore:aws-ec2-enable-at-rest-encryption #! tfsec:ignore:aws-ec2-enforce-http-token-imds
# resource "aws_instance" "a4l_bastion" {
#   ami                         = "ami-033b95fb8079dc481"
#   instance_type               = "t2.micro"
#   subnet_id                   = module.vpc.public_subnets[0]
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [aws_security_group.bastion.id]
#   key_name                    = aws_key_pair.a4l.key_name

#   tags = {
#     Name = "A4L-BASTION"
#   }
# }
