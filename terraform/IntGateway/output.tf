output "igw_id" {
    value = {for k,v in var.int_gw : k=>aws_internet_gateway.igw[k].id}
}