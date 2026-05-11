# Muestra el nombre e IP asignada por DHCP tras el despliegue
output "ej2-server1" {
  value = {
    nombre = "ej2-server1"
    ip     = try(libvirt_domain.ej2-server1.network_interface[0].addresses[0], "No disponible")
  }
}
