resource "docker_image" "app" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_container" "app" {
  name  = var.container_name
  image = docker_image.app.image_id

  ports {
    internal = 80
    external = var.host_port
  }

  networks_advanced {
    name = var.network_name
  }
}
