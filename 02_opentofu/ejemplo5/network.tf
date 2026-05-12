# Red NAT con DHCP: proporciona conectividad exterior a server1
resource "libvirt_network" "ej5-nat-dhcp" {
  name      = "ej5-nat-dhcp"
  mode      = "nat"
  domain    = "example.com"
  addresses = ["192.168.100.0/24"]
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

# Red muy aislada (mode=none): comunicación directa entre VMs sin acceso exterior
resource "libvirt_network" "ej5-muy-aislada" {
  name      = "ej5-muy-aislada"
  mode      = "none"
  autostart = true
}
