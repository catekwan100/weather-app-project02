variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    "dependency_id" = length(var.dependson)
  }
}

locals {
    tags = {for k,v in var.asgs: k=>{Name= k}}
}

resource "aws_security_group" "asg" {
  for_each = var.asgs
  name        = each.value["name"]
  vpc_id      = var.vpc_id[each.value["vpc_key"]]
  revoke_rules_on_delete = each.value["revoke_rules_on_delete"]
  dynamic "ingress" {
    for_each = each.value["ingress"] == {} ? {} : each.value["ingress"]
    content {
    description      = ingress.value.description
    from_port        = ingress.value.from_port
    to_port          = ingress.value.to_port
    protocol         = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
    self = ingress.value.self
    }
  }
  dynamic "egress" {
    for_each = each.value["egress"] == {} ? {} : each.value["egress"]
    content {
    description      = egress.value.description
    from_port        = egress.value.from_port
    to_port          = egress.value.to_port
    protocol         = egress.value.protocol
    cidr_blocks = egress.value.cidr_blocks
    self = egress.value.self
    }
  }

  tags = local.tags[each.key]
}
