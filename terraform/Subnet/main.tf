variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    "dependency_id" = length(var.dependson)
  }
}

locals {
    tags = {for k,v in var.snets: k=>{Name= k}}
}

resource "aws_subnet" "snet" {
    for_each = var.snets
    vpc_id     = var.vpc_id[each.value["vpc_key"]]
    availability_zone = each.value["availability_zone"]
    cidr_block = each.value["cidr_block"]
    tags = local.tags[each.key]
    depends_on = [null_resource.depends]
}
