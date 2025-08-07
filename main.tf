terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.23.0"
    }
  }
}

provider "docker" {}

# Pulling the latest nginx image.
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create and run nginx container
resource "docker_container" "nginx_container" {
  name  = "nginx-terraform"
  image = docker_image.nginx.latest
  ports {
    internal = 50
    external = 5050
  }
}
