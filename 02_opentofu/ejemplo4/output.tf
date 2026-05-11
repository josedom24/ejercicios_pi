# Muestra el nombre e IPs: ip1 por DHCP (NAT), ip2 estática (red aislada)
output "ej4-server1" {
  value = {
    nombre = "ej4-server1"
    ip1    = try(libvirt_domain.ej4-server1.network_interface[0].addresses[0], "No disponible")
    ip2    = try(libvirt_domain.ej4-server1.network_interface[1].addresses[0], "No disponible")
  }
}
