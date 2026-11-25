output "docker_application_url" {
  value = module.compute.application_url
}

output "docker_network" {
  value = module.network.network_name
}

output "docker_container" {
  value = module.compute.container_name
}

output "kubernetes_namespace" {
  value = module.kubernetes.namespace
}

output "kubernetes_deployment" {
  value = module.kubernetes.deployment_name
}

output "kubernetes_service" {
  value = module.kubernetes.service_name
}
