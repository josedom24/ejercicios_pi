# Ejercicios del Proyecto Integrado

Repositorio con los ejercicios prácticos del módulo de **Proyecto Integrado**.

## Estructura

### `01_ansible/` — Automatización con Ansible

- **`ejercicio2/`** — Playbook básico: actualización del sistema, instalación de paquetes, copia de ficheros, uso de templates Jinja2 y gestión de bases de datos MariaDB.
- **`ejercicio3/`** — Playbook con roles: organización en roles `commons`, `apache2` y `mariadb`, con handlers, templates y ficheros de configuración propios de cada rol.

### `02_opentofu/` — Infraestructura como código con OpenTofu + libvirt

- **`ejemplo1/`** — Despliegue de una máquina virtual Debian sobre KVM/libvirt usando un clon ligero (backing store) sobre una imagen base. Incluye configuración cloud-init con usuario, clave SSH, teclado, zona horaria e instalación de paquetes.
