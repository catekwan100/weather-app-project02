output "ssh_key" {
  value = tls_private_key.prv.private_key_pem
}

output "key_name" {
  value = aws_key_pair.pair.key_name
}
