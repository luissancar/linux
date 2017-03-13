# Servidor DHCP  

Instalamos el demonio.  

  apt-get install isc-dhcp-server  
  
Editamos el archivo isc-dhcp-server, ubicado en /etc/default/.  
Donde pone INTERFACES, entre las comillas, vamos a escribir el nombre de la tarjeta de red que se va a encargar de asignar direcciones IP.  

Abrimos el archivo de configuración /etc/dhcp/dhcpd.conf.  
~~~
subnet 192.168.5.0 netmask 255.255.255.0 {
  range 192.168.5.50 192.168.5.100;
  option domain-name-servers 8.8.8.8, 80.58.61.250;
  option domain-name "dhcpserver";
  option routers 192.168.5.1;
  option broadcast-address 192.168.5.255;
  default-lease-time 600;
  max-lease-time 7200;
}
~~~  

- subnet y netmask. Subnet es la red a la cual vamos a asignar direcciones IP y netmask es la máscara de subred.  
- range. Es el rango de direcciones IP que se van a asignar.  
- option domain-name-servers. Los servidores DNS.  
- option domain-name. El nombre de nuestro dominio.  
- option routers. Es la puerta de enlace.  
- option broadcast-address. La dirección de difusión.  
- default-lease-time el tiempo en horas durante el que se reserva una dirección IP a cierto equipo.  
- max-lease-time el tiempo máximo que se reservará una IP para un equipo.  
  
  
