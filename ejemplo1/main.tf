terraform {
    required_providers {
        docker = {
            # he actualizado el repo del provider
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" { }


resource "docker_image" "imagen-ubuntu" {
// OJO, tomo el último UBUNTU 
  #name = var.nombre_imagen
  name = "${var.nombre_imagen}:${var.version_imagen}"
}

/*
    Me estoy creando un contenedor
*/

resource "docker_container" "contenedor-ubuntu" {
  name  = "mi_contenedor_ubuntu"
  image = docker_image.imagen-ubuntu.latest
  
  dynamic "volumes" {
      for_each = var.volumenes
      content {
          volume_name       =   contains(keys(volumes.value), "volume_name") ? volumes.value ["volume_name"] : null
          # volume_name    = lookup(volumes.value, "volume_name", null)
          host_path         =   volumes.value["host_path"]
          container_path    =   volumes.value["container_path"]
          
      }
  }
  
}
/*  volumes {
        host_path = "/home/ubuntu/environment/cursoTerraform"
        container_path = "/cursoTerraform"
  }
  volumes {
        host_path = "/home/ubuntu/environment/ivan"
        container_path = "/ivan"    
  }
  */
  
  


/*
2 volumenes dentro del contenedor:
HOST
/home/ubuntu/environment/cursoTerraform         >           /cursoTerraform
/home/ubuntu/environment/ivan                   >           /ivan



from_container - (Optional, string) The container where the volume is coming from.
host_path - (Optional, string) The path on the host where the volume is coming from.
volume_name - (Optional, string) The name of the docker volume which should be mounted.
container_path - (Optional, string) The path in the container where the volume will be mounted.

*/