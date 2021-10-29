output "jump_box_ip" {
  value = module.compute.jump_box_ip
}

output "app_instance_ip" {
  value = module.compute.private_ip
}

output "ssh_key_path" {
  value = local_file.my_key_file.filename
}