variable "dependson" {}
resource "null_resource" "depends" {
  triggers = {
    "dependency_id" = length(var.dependson)
  }
}

locals {
    tags = {for k,v in var.instances: k=>{Name= k}}
}


resource "aws_instance" "instance" {
    for_each = var.instances
    ami = each.value["ami"]
    instance_type = each.value["instance_type"]
    user_data = data.cloudinit_config.image.rendered
    subnet_id     = var.snet_id[each.value["snet_key"]]
    key_name = var.key_name
    vpc_security_group_ids = var.asg_id
    associate_public_ip_address = true
    tags = local.tags[each.key]
    depends_on = [null_resource.depends]
}

data "cloudinit_config" "image" {
  part {
    filename     = "image.sh"
    content_type = "text/x-shellscript"
    content = templatefile("../../image.sh")
  }
  part {
    filename     = "Dockerfile"
    content_type = "text"
    content = templatefile("../../wwsm/Dockerfile")
  }
}