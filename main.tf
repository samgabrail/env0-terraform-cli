terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name = "${var.image_name}:${var.image_tag}"
}

resource "docker_container" "nginx_container" {
  name  = "webserver-${terraform.workspace}"
  image = docker_image.nginx_image.image_id
  ports {
    internal = var.internal_port
    external = terraform.workspace == "prod" ? var.external_port_prod : var.external_port_dev
  }
}