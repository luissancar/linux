# Configuración tarjertas de red  
- Editar el fichero: /etc/network/interfaces  

~~~
auto identificador_t_red
iface identificador_t_red inet {static / dhcp}  // si es dhcp, aquí termina la configuración
address ip
netmask máscara subred
gateway puerta enlace
dns-nameservers dns1 dns2 ..
~~~
Ejemplo en  Debian 10   

La configuración de las interfaces de red está guardada en el archivo /etc/network/interfaces:
~~~
/etc/network/interfaces

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
# allow-hotplug eth0
# iface eth0 inet dhcp

# Static IP address
auto eth0
iface eth0 inet static
        address 192.168.1.100
        netmask 255.255.255.0
        network 192.168.1.0
        broadcast 192.168.1.255
        gateway 192.168.1.1
~~~

También es necesario indicar la dirección del servidor DNS. En esta configuración, el servidor DNS funciona en el router/modem ADSL, por lo que el parámetro para nameserver debe tener el valor 192.168.1.1, en el archivo/etc/resolv.conf:
~~~
/etc/resolv.conf
domain localdomain
search localdomain
nameserver 192.168.1.1
~~~
