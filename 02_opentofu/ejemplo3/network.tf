# Red NAT con DHCP: proporciona conectividad exterior a las VMs
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
