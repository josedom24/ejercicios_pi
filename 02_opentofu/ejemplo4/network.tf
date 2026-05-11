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

# Red aislada sin DHCP: comunicación interna con IP estática
resource "libvirt_network" "aislada-static" {
  name      = "aislada-static"
  mode      = "none"
  addresses = ["192.168.130.0/24"]
  bridge    = "virbr13"
  dhcp { enabled = false }
  autostart = true
}
