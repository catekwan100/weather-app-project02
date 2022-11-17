module "VPC" {
    source = "./VPC"
    vpcs = var.vpcs
}

module "Subnet" {
    source = "./Subnet"
    snets = var.snets
}

module "Route" {
    source = "./Route"
    routes = var.routes
    snet_id = module.Subnet.snet_id
    gw = module.IGW.igw_id
    dependson = [module.Subnet.snet_id,module.IGW.igw_id]
}

module "ASG" {
    source = "./SG"
    asgs = var.asgs     
}

module "IGW" {
    source = "./IntGateway"
    int_gw = var.int_gw
    vpc_id = module.VPC.vpc_id
    dependson = [module.VPC.vpc_id]    
}

module "Instance" {
    source = "./Instance"
    instances = var.instances
    snet_id = module.Subnet.snet_id
    key_name = module.Keys.key_name
    asg_id = module.ASG.asg_id
    dependson = [mmodule.Subnet.snet_id,module.ASG.asg_id] 
}

module "Keys" {
  source = "./Key"
}