output "snet_id" {
    value = {for k,v in var.snets : k=>aws_subnet.snet[k].id}
}