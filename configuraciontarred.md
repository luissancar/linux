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
