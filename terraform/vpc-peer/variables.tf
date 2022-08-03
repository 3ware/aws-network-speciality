variable "vpc" {
  description = "A map of VPCs to create"
  type = map(object({
    cidr            = string
    azs             = list(string)
    private_subnets = list(string)
  }))
}
