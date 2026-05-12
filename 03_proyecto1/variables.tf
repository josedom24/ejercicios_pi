# Pool de almacenamiento donde se crean los volúmenes (disco y cloud-init)
variable "libvirt_pool_name" {
  type        = string
  description = "Nombre del pool de almacenamiento libvirt."
  default     = "default"
}

# Imagen base Debian para apache2
variable "base_image_debian" {
  type        = string
  description = "Nombre de la imagen base Debian en el pool."
  default     = "debian13-base.qcow2"
}

# Imagen base Ubuntu para mariadb
variable "base_image_ubuntu" {
  type        = string
  description = "Nombre de la imagen base Ubuntu en el pool."
  default     = "ubuntu2404-base.qcow2"
}
