output "network_name" {
  description = "Created Docker network name"
  value       = docker_network.this.name
}

output "network_id" {
  description = "Created Docker network ID"
  value       = docker_network.this.id
}
