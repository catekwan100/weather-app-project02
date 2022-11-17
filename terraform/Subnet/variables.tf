variable "snets" {
  type = map
  description = <<EOT
        vpc_id - (Required) The VPC ID.
        cidr_block - (Optional) The IPv4 CIDR block for the subnet.
  EOT
  default = {}
}

variable "vpc_id" {
  
}
