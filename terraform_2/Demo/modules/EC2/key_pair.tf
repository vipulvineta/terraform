resource "tls_private_key" "demo" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "demo_key" {
  key_name   = var.key_name
  public_key = tls_private_key.demo.public_key_openssh
}
