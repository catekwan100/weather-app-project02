variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    "dependency_id" = length(var.dependson)
  }
}

locals {
    tags = {for k,v in var.int_gw: k=>{Name= k}}
}

resource "aws_internet_gateway" "igw" {
    for_each = var.int_gw
    vpc_id     = var.vpc_id[each.value["vpc_key"]]
    tags = local.tags[each.key]
    depends_on = [null_resource.depends]
}
