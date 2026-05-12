# apache2: ip1 por DHCP (NAT), ip2 estática en red-conf, ip3 estática en red-datos
output "p1-apache2" {
  value = {
    nombre = "p1-apache2"
    ip1    = try(libvirt_domain.p1-apache2.network_interface[0].addresses[0], "No disponible")
    ip2    = try(libvirt_domain.p1-apache2.network_interface[1].addresses[0], "No disponible")
    ip3    = try(libvirt_domain.p1-apache2.network_interface[2].addresses[0], "No disponible")
  }
}

# mariadb: ip1 por DHCP (NAT), ip2 estática en red-conf, ip3 estática en red-datos
output "p1-mariadb" {
  value = {
    nombre = "p1-mariadb"
    ip1    = try(libvirt_domain.p1-mariadb.network_interface[0].addresses[0], "No disponible")
    ip2    = try(libvirt_domain.p1-mariadb.network_interface[1].addresses[0], "No disponible")
    ip3    = try(libvirt_domain.p1-mariadb.network_interface[2].addresses[0], "No disponible")
  }
}
