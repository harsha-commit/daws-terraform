output "public_ip" {
  value = aws_instance.this[0].public_ip
}

output "private_ip" {
  value = aws_instance.this[0].private_ip
}
