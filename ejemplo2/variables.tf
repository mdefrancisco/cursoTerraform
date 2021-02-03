variable "nombre_imagen" {
    description = "Nombre y version de la imagen que voy a descargar"
    type        = string
    default     = "nginx"
}

variable "version_imagen" {
    description = "Version de la imagen que voy a descargar"
    type        = string
    default     = "latest"
}

variable "info_contenedor" {
description     = "Nombre y puerto de contenedor"
type            = map(string)
default         =  {
        contenedorA     =   "8090"
        contenedorB     =   "8091"
  }
 }