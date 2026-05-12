##############################################
# apache2 — Debian (servidor web)
##############################################

# Clon ligero sobre la imagen base Debian
resource "libvirt_volume" "p1-apache2-disk" {
  name             = "p1-apache2.qcow2"
  pool             = var.libvirt_pool_name
  base_volume_name = var.base_image_debian
  base_volume_pool = var.libvirt_pool_name
  format           = "qcow2"
}

# ISO cloud-init con la configuración inicial de apache2
resource "libvirt_cloudinit_disk" "p1-apache2-cloudinit" {
  name           = "p1-apache2-cloudinit.iso"
  pool           = var.libvirt_pool_name
  user_data      = file("${path.module}/cloud-init/user-data-apache2.yaml")
  network_config = file("${path.module}/cloud-init/network-config-apache2.yaml")
}

resource "libvirt_domain" "p1-apache2" {
  name   = "p1-apache2"
  memory = 1024
  vcpu   = 1

  # Red 1: NAT con DHCP (acceso exterior)
  network_interface {
    network_id     = libvirt_network.p1-red-externa.id
    wait_for_lease = true
  }

  # Red 2: gestión con IP estática 192.168.201.3
  network_interface {
    network_id = libvirt_network.p1-red-conf.id
  }

  # Red 3: datos con IP estática 10.0.0.1
  network_interface {
    network_id = libvirt_network.p1-red-datos.id
  }

  disk { volume_id = libvirt_volume.p1-apache2-disk.id }
  cloudinit = libvirt_cloudinit_disk.p1-apache2-cloudinit.id

  # Consola serie necesaria para acceder con "virsh console"
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}

##############################################
# mariadb — Ubuntu (servidor de base de datos)
##############################################

# Clon ligero sobre la imagen base Ubuntu
resource "libvirt_volume" "p1-mariadb-disk" {
  name             = "p1-mariadb.qcow2"
  pool             = var.libvirt_pool_name
  base_volume_name = var.base_image_ubuntu
  base_volume_pool = var.libvirt_pool_name
  format           = "qcow2"
}

# ISO cloud-init con la configuración inicial de mariadb
resource "libvirt_cloudinit_disk" "p1-mariadb-cloudinit" {
  name           = "p1-mariadb-cloudinit.iso"
  pool           = var.libvirt_pool_name
  user_data      = file("${path.module}/cloud-init/user-data-mariadb.yaml")
  network_config = file("${path.module}/cloud-init/network-config-mariadb.yaml")
}

resource "libvirt_domain" "p1-mariadb" {
  name   = "p1-mariadb"
  memory = 1024
  vcpu   = 1

  # Red 1: NAT con DHCP (acceso exterior)
  network_interface {
    network_id     = libvirt_network.p1-red-externa.id
    wait_for_lease = true
  }

  # Red 2: gestión con IP estática 192.168.201.2
  network_interface {
    network_id = libvirt_network.p1-red-conf.id
  }

  # Red 3: datos con IP estática 10.0.0.2
  network_interface {
    network_id = libvirt_network.p1-red-datos.id
  }

  disk { volume_id = libvirt_volume.p1-mariadb-disk.id }
  cloudinit = libvirt_cloudinit_disk.p1-mariadb-cloudinit.id

  # Consola serie necesaria para acceder con "virsh console"
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}
