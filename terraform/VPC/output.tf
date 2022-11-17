output "vpc_id" {
    value = {for k,v in var.vpcs: k => aws_vpc.vpc[k].id}
}

output "vpc_cidr" {
    value = {for k,v in aws_vpc.vpc : k=>aws_vpc.vpc[k].cidr_block}
}