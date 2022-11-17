resource "tls_private_key" "prv" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pair" {
  key_name   = "test"
  public_key = tls_private_key.prv.public_key_openssh

    provisioner "local-exec" {
    command = "echo '${tls_private_key.prv.private_key_pem}' > ./test.pem && chmod 400 ./test.pem"
  }
}