# Red NAT con DHCP: proporciona conectividad exterior a las VMs
resource "libvirt_network" "p1-red-externa" {
  name      = "p1-red-externa"
  mode      = "nat"
  domain    = "example.com"
  addresses = ["192.168.200.0/24"]
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

# Red de gestión/configuración (mode=none): comunicación entre VMs con IP estática
resource "libvirt_network" "p1-red-conf" {
  name      = "p1-red-conf"
  mode      = "none"
  addresses = ["192.168.201.0/24"]
  autostart = true
}

# Red de datos (mode=none): enlace directo entre apache2 y mariadb sin acceso exterior
resource "libvirt_network" "p1-red-datos" {
  name      = "p1-red-datos"
  mode      = "none"
  autostart = true
}
