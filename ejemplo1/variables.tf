variable "nombre_imagen" {
    description = "Nombre y version de la imagen que voy a descargar"
    type        = string
    default     = "ubuntu"
}

variable "version_imagen" {
    description = "Version de la imagen que voy a descargar"
    type        = string
    default     = "21.04"
}

variable "volumenes" {
description     = "Volumenes que vamos a montar en el contenedor"
type            = list(map(string))
default         =  [
  {
        //volume_name     =   "vol_curso"
        host_path       =   "/home/ubuntu/environment/cursoTerraform"
        container_path  =   "/cursoTerraform"
  },
  {
        volume_name     =   "vol_ivan"
        host_path       =   "/home/ubuntu/environment/ivan"
        container_path  =   "/ivan"    
  }
 ]
 }