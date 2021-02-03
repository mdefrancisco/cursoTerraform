terraform {
    required_providers {
        docker = {
            # he actualizado el repo del provider
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" { }


resource "docker_image" "imagen-nginx" {
  name  =   var.nombre_imagen
  //name = "${var.nombre_imagen}:${var.version_imagen}"
  //name = docker_image.imagen-nginx.latest
}

resource "docker_container" "contenedor-nginx" {
  count = 3
  name  =   "mi_contenedor_nginx_${count.index}"
  image =   docker_image.imagen-nginx.latest
  ports {
      internal      =       80
      external      =       8080 + count.index
  }
}

resource "docker_container" "contenedor-nginx-diferentes" {
  for_each = var.info_contenedor
  # La variable each me da: each:key y un each.value
  name  =   each.key
  image =   docker_image.imagen-nginx.latest
  ports {
      internal      =       80
      external      =       each.value
  }
}