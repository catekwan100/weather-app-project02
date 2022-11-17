vpcs = {
    vpc1 = {
        cidr_block = "10.10.10.0/24"
        enable_dns_hostnames = true
        enable_dns_support = true
    }
}

snets = {
    snetA = {
        vpc_key = "vpc1"
        cidr_block = "10.10.10.0/26"
        availability_zone = "us-west-2a"
    }
}

int_gw = {
    igw1 = {
        vpc_key = "vpc1"
    }
}

routes = {
    route1 = {
        vpc_key = "vpc1"
        route = {
            r1={
            cidr_block = "0.0.0.0/0"    
            snet_key = "snetA"
            }            
        }
    }
}

instances = {
    ins1 = {
        snet_key = "snetA"
        asg_key = "asg1"
        ami = "ami-0ee8244746ec5d6d4"
        instance_type = "t2.small"
        availability_zone = "us-west-2a"       
    }
}

asgs = {
    asg1 = {
        vpc_key = "vpc1"
        name = "ASG"
        revoke_rules_on_delete = true
        ingress = {
            i1 = {
                description = "anywhere"
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
                self = false                
            }        
        }
        egress = {
           e1= { 
            description      = "anywhere"
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            self = false
           }          
        }
    }
}
