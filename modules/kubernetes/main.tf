resource "kubernetes_namespace_v1" "app" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment_v1" "app" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace_v1.app.metadata[0].name

    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.image_name

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "app" {
  metadata {
    name      = "${var.app_name}-service"
    namespace = kubernetes_namespace_v1.app.metadata[0].name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
