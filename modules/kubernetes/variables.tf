variable "namespace" {
  type = string
}

variable "app_name" {
  type = string
}

variable "replicas" {
  type    = number
  default = 1
}

variable "image_name" {
  type    = string
  default = "nginx:alpine"
}
