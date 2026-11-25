output "namespace" {
  value = kubernetes_namespace_v1.app.metadata[0].name
}

output "deployment_name" {
  value = kubernetes_deployment_v1.app.metadata[0].name
}

output "service_name" {
  value = kubernetes_service_v1.app.metadata[0].name
}
