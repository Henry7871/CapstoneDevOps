output "nginx_ip" {
  value = module.compute.nginx_ip
}

output "app_instance_ip" {
  value = module.compute.app_instance_ip
}

output "ssh_key_path" {
  value = local_file.my_key_file.filename
}

output "mongodb_connection_strings" {
  value = mongodbatlas_cluster.my_cluster.connection_strings.0.standard_srv
}