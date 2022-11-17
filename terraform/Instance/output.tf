output "instance_id" {
    value = {for k,v in var.instances : k=>aws_instance.instance[k].id}
}

output "private_dns" {
    value = [for i in aws_instance.instance : i.private_dns]
}

output "instance_ip" {
  value       = "${aws_instance.ec2_backend_server.public_ip}"
  description = "Ec2 instance public IP"
}
