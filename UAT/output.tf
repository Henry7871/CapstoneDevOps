output "nginx_ip" {
  value = module.compute.nginx_ip
}

output "app_instance_ip" {
  value = module.compute.app_instance_ip
}

output "ssh_key_path" {
  value = local_file.my_key_file.filename
}