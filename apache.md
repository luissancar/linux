# Apache

sudo apt-get install apache2  
## Creación vitual hosts
El primer paso será crear una estructura de directorios que alojará los datos del sitio que vamos a proporcionar a nuestros visitantes.  

~~~
sudo mkdir -p /var/www/sitioa.com/html
sudo mkdir -p /var/www/sitiob.com/html
~~~
Damos permisos.  
~~~
sudo chmod -R 777 /var/www
~~~

Creamos cutremente el sitio web.
~~~
echo "sitioa.com" > /var/www/sitioa.com/html/index.html
echo "sitiob.com" > /var/www/sitiob.com/html/index.html
~~~
Los archivos virtual host son archivos que especifican la configuración actual de un virtual host e indican como el servidor Apache va a responder a varias solicitudes de dominio.  
Apache viene con un archivo virtual host por defecto llamado 000-default.conf. Vamos a copiarlo para crear un archivo virtual host para cada uno de nuestros dominios.  
~~~
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/sitioa.com.conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/sitiob.com.conf
~~~

Configuramos los ficheros.  
~~~
<VirtualHost *:80>
    ServerAdmin admin@sitioa.com
    ServerName sitioa.com
    ServerAlias www.sitioa.com
    DocumentRoot /var/www/sitioa.com/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
~~~
Igual para sitiob.com.  
Ahora que hemos creado nuestros archivos de virtual host, debemos habilitarlos. Apache incluye algunas herramientas que nos permiten hacer esto.

Podemos usar la herramienta a2ensite para habilitar cada uno de nuestros sitios.  
~~~
sudo a2ensite sitioa.com.conf
sudo a2ensite sitiob.com.conf
~~~
Deshabilitamos el sitio por defecto definido en 000-default.conf:
~~~
sudo a2dissite 000-default.conf
~~~

Reiniciamos el demonio.
~~~
sudo service apache2 restart
~~~
