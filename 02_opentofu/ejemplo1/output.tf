# Muestra el nombre e IP asignada por DHCP tras el despliegue
output "ej1-server1" {
  value = {
    nombre = "ej1-server1"
    ip     = try(libvirt_domain.ej1-server1.network_interface[0].addresses[0], "No disponible")
  }
}
