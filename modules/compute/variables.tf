variable "container_name" {
  description = "Docker container name"
  type        = string
}

variable "image_name" {
  description = "Docker image to run"
  type        = string
  default     = "nginx:alpine"
}

variable "host_port" {
  description = "Host port exposed by container"
  type        = number
}

variable "network_name" {
  description = "Docker network name"
  type        = string
}
