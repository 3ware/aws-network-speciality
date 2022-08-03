module "vpc_peering_a_b" {
  count   = var.peer_a_b ? 1 : 0
  source  = "grem11n/vpc-peering/aws"
  version = "4.1.0"

  providers = {
    aws.this = aws
    aws.peer = aws
  }

  this_vpc_id = module.vpc["a4l-vpca"].vpc_id
  peer_vpc_id = module.vpc["a4l-vpcb"].vpc_id

  auto_accept_peering = true
}

resource "aws_security_group_rule" "icmp_a_b" {
  count     = var.peer_a_b ? 1 : 0
  type      = "ingress"
  protocol  = "icmp"
  from_port = 8
  to_port   = 0
  #* Same region can use source_security_group
  source_security_group_id = aws_security_group.this["a4l-vpca"].id
  security_group_id        = aws_security_group.this["a4l-vpcb"].id
}
