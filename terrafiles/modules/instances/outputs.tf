output "public-ip"{
    value = aws_instance.instance.public_ip
}