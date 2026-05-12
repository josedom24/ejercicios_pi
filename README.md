# Ejercicios del Proyecto Integrado

Repositorio con los ejercicios prácticos del módulo de **Proyecto Integrado**.

## Estructura

### `01_ansible/` — Automatización con Ansible

- **`ejercicio2/`** — Playbook básico: actualización del sistema, instalación de paquetes, copia de ficheros, uso de templates Jinja2 y gestión de bases de datos MariaDB.
- **`ejercicio3/`** — Playbook con roles: organización en roles `commons`, `apache2` y `mariadb`, con handlers, templates y ficheros de configuración propios de cada rol.

### `02_opentofu/` — Infraestructura como código con OpenTofu + libvirt

Todos los ejemplos usan clones ligeros (backing store) sobre una imagen base qcow2 y cloud-init para la configuración inicial. Los nombres de recursos llevan el prefijo `ejN-` para evitar conflictos entre ejemplos.

- **`ejemplo1/`** — 1 VM Debian. Red `default` con DHCP. Introducción básica a OpenTofu con libvirt.

- **`ejemplo2/`** — 1 VM Debian. Red `default` con DHCP. Añade un disco extra de 1 GB.

- **`ejemplo3/`** — 1 VM Debian con 2 interfaces de red: NAT con DHCP (`ej3-nat-dhcp`) y red `default`. Disco extra de 1 GB. Introduce la definición de redes con `network.tf` y la configuración de red via cloud-init (`network-config`).

- **`ejemplo4/`** — 1 VM Debian con 2 interfaces: NAT con DHCP (`ej4-nat-dhcp`) y red aislada sin DHCP (`ej4-aislada-static`, IP estática 192.168.130.10). Disco extra de 1 GB. Incluye scripts `start.sh` y `stop.sh` para gestionar el ciclo de vida del escenario.

- **`ejemplo5/`** — 2 VMs: server1 (Debian) y server2 (Ubuntu). Server1 actúa como gateway con acceso exterior via NAT (`ej5-nat-dhcp`) y conectividad interna en red muy aislada (`ej5-muy-aislada`, 10.0.0.1). Server2 solo tiene red muy aislada (10.0.0.2, gateway 10.0.0.1). Escenario de red privada con un único punto de salida.

### `03_proyecto1/` — Infraestructura base del Proyecto 1

Escenario con 2 VMs (apache2 en Debian y mariadb en Ubuntu) conectadas a tres redes: una exterior NAT con DHCP, una red de gestión y una red de datos, ambas aisladas con IPs estáticas. Sirve como infraestructura base sobre la que se desarrolla el Proyecto 1.
