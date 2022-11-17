variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    "dependency_id" = length(var.dependson)
  }
}

locals {
    tags = {for k,v in var.routes: k=>{Name= k}}
}

resource "aws_route_table" "route" {
    for_each = var.routes
    vpc_id = var.vpc_id[each.value["vpc_key"]]
    dynamic "route" {
        for_each = each.value["route"]
        content{
            cidr_block = route.value.cidr_block
            gateway_id = var.gw[route.value.gw_key]
        }
    }
    tags = local.tags[each.key]
}


resource "aws_route_table_association" "association" {
  subnet_id      = var.snet_id
  route_table_id = "${aws_route_table.route.id}"
}
