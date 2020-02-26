# IPTABLES



Un firewall es un dispositivo que filtra el tráfico entre redes,  un firewall es un hardware especifico con un sistema operativo o una IOS que filtra el tráfico TCP/UDP/ICMP/../IP y decide si un paquete pasa, se modifica, se convierte o se descarta.

IPtables es un sistema de firewall vinculado al kernel de linux( a partir del kernel 2.4 ) .  iptables esta integrado con el kernel, es parte del sistema operativo. ¿Cómo se pone en marcha? Realmente lo que se hace es aplicar reglas. Para ellos se ejecuta el comando iptables, con el que añadimos, borramos, o creamos reglas. Por ello un firewall de iptables no es sino un simple script de shell en el que se van ejecutando las reglas de firewall.

Los diferentes *hooks* presentes en el *framework* `netfilter` coinciden con las siguientes cadenas de `iptables`:

- **PREROUTING**: tráfico entrante, justo antes de ingresar a la pila de red del kernel. Las reglas en esta cadena son procesadas antes de tomar cualquier decisión de ruteo respecto hacia dónde enviar el paquete.
- **INPUT**: tráfico entrante, luego de haber sido ruteado y destinado al sistema local.
- **FORWARD**: tráfico entrante, luego de haber sido ruteado y destinado hacia otro host (reenviado).
- **OUTPUT**: tráfico saliente originado en el sistema local, inmediatamente luego de haber ingresado a la pila de red del kernel.
- **POSTROUTING**: tráfico saliente originado en el sistema local o reenviado, luego de haber sido ruteado y justo antes de ser puesto en el cable.

#### replas

iptables -nL      -> muestra las reglas que tenemos

iptablesw -F     -> borrar todas las reglas

Politicas ACCEPT -> acepta , DROP -> no acepta

iptables -P INPUT ACCEPT  -> acepta todos los paquetes de entrada

iptables -A INPUT -i eth0 -s 192.168.5.0/24  -j  ACCEPT

- -A -> añade regla a la cadena INPUT
- -s  -> source procedentes  de la red 192.168.5.0/24
- -j -> jump da permiso ACCEPT
- -i -> en esta regla se utilizará la tarjeta eth0, si fuera OUTPUT utilizaremos -o, si sólo tenemos una tarjeta de red no es necesario. 

iptables -A INPUT -s 192.168.5.0/24  -p tcp --dport 80 -j  DROP

- -p tcp --dport 80 bloquea los paquetes de entrada dirigidos al puerto 80, protocolo tcp, podría ser udp.

iptables -A INPUT -s 192.168.5.0/24  -p tcp --sport 80 -j  DROP

- -p tcp --dport 80 bloquea los paquetes de entrada procedentes del puerto 80, protocolo tcp, podría ser udp.

iptables -D INPUT 3 -> borra la regla 3 de la cadena INPUT

iptables -A INPUT -s 192.168.0.0/24 -p udp --dport 21 -j DROP -> bloquea la dirección ip de origen

iptables -A INPUT -d 192.168.0./24 -p udp --dport 21 -j DROP -> bloquea la dirección ip de destino

iptables -A INPUT -s 192.168.0.0/24 -d 192.168.7.0/24 -p udp --dport 21 -j DROP -> bloquea la ip 192.168.0.0 de origen a la ip 192.168.7.0 de destino.





































###### 
