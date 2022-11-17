output "ALB" {
  value = module.ALB.alb_dns_name
}

output "instances" {
    value = module.Instance.private_dns
}

output "ssh" {
    value = module.Keys.ssh_key
    sensitive = true
}