output "container_name" {
  value = docker_container.app.name
}

output "container_id" {
  value = docker_container.app.id
}

output "application_url" {
  value = "http://localhost:${var.host_port}"
}
