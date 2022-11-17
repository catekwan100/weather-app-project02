output "asg_id" {
    value = [for i in aws_security_group.asg: i.id]
}