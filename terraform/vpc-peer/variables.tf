variable "vpc" {
  description = "A map of VPCs to create"
  type = map(object({
    cidr            = string
    azs             = list(string)
    private_subnets = list(string)
  }))
}

variable "peer_a_b" {
  description = "Feature toggle to enable peering between VPCA and VPCB"
  type        = bool
  default     = false
}
