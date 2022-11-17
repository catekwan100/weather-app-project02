variable "vpcs" {
    description = <<EOT
        cidr_block - (Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length.
    EOT
    type = map
    default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type = map
  default = {}
}