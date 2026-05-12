# Red NAT con DHCP: proporciona conectividad exterior a las VMs
resource "libvirt_network" "ej3-nat-dhcp" {
  name      = "ej3-nat-dhcp"
  mode      = "nat"
  domain    = "example.com"
  addresses = ["192.168.100.0/24"]
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}
