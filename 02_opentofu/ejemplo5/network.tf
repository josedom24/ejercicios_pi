# Red NAT con DHCP: proporciona conectividad exterior a server1
resource "libvirt_network" "nat-dhcp" {
  name      = "nat-dhcp"
  mode      = "nat"
  domain    = "example.com"
  addresses = ["192.168.100.0/24"]
  bridge    = "virbr10"
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

# Red muy aislada (mode=none): comunicación directa entre VMs sin acceso exterior
resource "libvirt_network" "muy-aislada" {
  name      = "muy-aislada"
  mode      = "none"
  bridge    = "virbr14"
  autostart = true
}
