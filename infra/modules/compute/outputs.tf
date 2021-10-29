output "jump_box_ip" {
    value = aws_instance.jump_box.public_ip
}

output "app_instance_ip" {
    value = aws_instance.app_instance.private_ip
}