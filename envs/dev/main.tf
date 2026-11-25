terraform {
  required_version = ">= 1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.35"
    }
  }
}

provider "docker" {}

provider "kubernetes" {
  config_path = pathexpand("~/.kube/config")
}

module "network" {
  source = "../../modules/network"

  network_name = "${var.environment}-network"
}

module "compute" {
  source = "../../modules/compute"

  container_name = "${var.environment}-web"
  image_name     = var.image_name
  host_port      = var.host_port
  network_name   = module.network.network_name
}

module "kubernetes" {
  source = "../../modules/kubernetes"

  namespace  = var.namespace
  app_name   = "${var.environment}-app"
  image_name = var.image_name
  replicas   = var.replicas
}
