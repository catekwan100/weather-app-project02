locals {
    tags = {for k,v in var.vpcs: k=>{Name= k}}
}

resource "aws_vpc" "vpc" {
    for_each = var.vpcs
    cidr_block = each.value["cidr_block"]
    enable_dns_hostnames = each.value["enable_dns_hostnames"]
    enable_dns_support   = each.value["enable_dns_support"]
    tags = local.tags[each.key]  //var.tags["vpc"]
}