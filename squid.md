# Squid servidor proxy
Un servidor proxy es un intermediario entre su dispositivo y Internet.

Un servidor proxy puede permanecer en el router local,  donde ayuda a aumentar la eficiencia de la red, autenticar a los usuarios de la red y aplicar restricciones de contenido. No requieren de ningún tipo de configuración por parte del usuario.
Squid es un programa que te permite realizar un proxy/caché con una gran variedad de configuraciones y usos.
#### instalación:

~~~
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install squid
~~~

Ya tenemos instalado squid con la configuración básica (puerto 3128).
Podemos configurar nuestro navegador para comprobar su funcionamiento. 

#### Configuración básica
Editamos el fichero  /etc/squid/squid.conf


Podemos cambiar el puerto en:

~~~
http_port 3128
~~~

 Establece el nombre de host que normalmente utilizaremos en nuestro equipo (p.e. ProxySquid).

~~~
visible_hostname ProxySquid
~~~

 Establece la acl que indica la dirección de nuestra red interna.

~~~
acl red_interna src 192.168.0.0/24
~~~

Indica que nuestra red interna tiene permiso para utilizar el proxy.

~~~
http access alow red_interna
~~~

Regularmente una lista de control de acceso se establece con la siguiente sintaxis:

~~~
acl [nombre de la lista] [tipo] [lo que compone a la lista]
~~~

Si se desea establecer una lista de control de acceso que abarque a toda la red local, basta definir la IP correspondiente a la red y la máscara de la sub-red. Por ejemplo, si se tiene una red donde los anfitriones tienen direcciones del segmento IP 172.16.100.0/28, se puede utilizar lo siguiente:

~~~
acl localnet src 172.16.100.0/28
~~~

También puede definirse una Lista de Control de Acceso especificando un archivo localizado en cualquier parte del disco duro y la cual contiene una lista de direcciones IP. Ejemplo:

~~~
acl permitidos src "/etc/squid/listas/permitidos"
~~~

#### Reglas de Control de Acceso.
Estas definen si se permite o deniega acceso hacia Squid. Se aplican a las Listas de Control de Acceso.
La sintaxis básica de una regla de control de acceso es la siguiente:

~~~
http_access [deny o allow] [lista de control de acceso]
~~~


#### Ejemplo :
Sólo permite el acceso a nuestra red:

~~~
acl red_interna src 192.168.1.0/24
acl all src 0.0.0.0/0

http access deny all
http access allow red_interna 
~~~





