#Fdisk

Es un comando utilizado para la gestión y administración del espacio en disco duro. Permite realizar diferentes acciones sobre el disco duro: 

- Listar todas las particiones
- Crear o editar particiones
- Verificar tamaño de una partición
- Eliminar particiones
- Ver el contenido de un disco en especifico


####Listar todas las particiones con fdisk

Para obtener la lista de todas las particiones existentes dentro del sistema operativo, usaremos el comando fdisk acompañado del parámetro “-l”,

~~~
 fdisk –l /dev/sdb 
~~~

####Crear una partición

 Accedemos a fdisk utilizando como argumento el disco sobre el cual vamos a trabajar.

Por ejemplo:

~~~
fdisk /dev/sdb
~~~

Ingresamos la tecla “n” (de nueva o new). Lo siguiente que la herramienta nos pedirá será el tipo de partición que se quiere crear, primaria o extendida (también conocida como lógica).

Presionaremos “p” para una partición primaria, mientras que usaremos “e” para seleccionar una partición extendida.

 Por ultimo, nos pedirá el primer y ultimo cilindro que definirán la partición. Podemos usar los valores por defecto en caso de querer hacer uso de todo el espacio disponible. O podemos personalizarlo indicando una dimensión en especifico. Donde, por ejemplo, +8G significa que creara una partición de 8 gigabytes, +1024M indica que se creara una partición de 1024 megabytes y en caso de no especificar la unidad, fdisk lo asumirá como sectores y el resultado sera +1024 sectores después del inicio.

Resulta importante resaltar que luego de hacer cualquier cambio con el comando fdisk, se debe finalizar escribiendo “w”, esto para confirmar la escritura de cada uno de los cambios.

####Formatear una partición
Después de crear la partición, es necesaríodarle formato.

~~~
mkfs.ext4 /dev/sdb5
~~~

Donde .ext4 es el formato a aplicar a la partición y /dev/sdb5 es un valor variable dependiente de la partición creada.

Verificar tamaño de una partición
Después de crear una partición podemos verificar el espacio total asignado. Para ello usamos el argumento “-s” y el nombre de la partición. Por ejemplo:

~~~
fdisk -s /dev/sdb5 
~~~


####Eliminar una partición
Nos  ubicarnos en la unidad de disco donde está la partición que deseamos borrar.

~~~
fdisk /dev/sdb 
~~~

Presionamos “d” (por delete) y a continuación nos solicitara el numero de partición correspondiente a la que nos interesa borrar.

Lo ultimo por hacer es presionar “w” para confirmar los cambios, los cuales serán aplicados la siguiente vez que iniciemos el sistema.


####Ver el contenido de un disco en especifico
Esta acción es muy sencilla y similar a listar todas las particiones del sistema. Utilizamos un argumento adicional que seria el nombre del disco correspondiente. Obteniendo algo como esto:

~~~
fdisk –l /dev/sdb 
~~~


#######Read more https://ayudalinux.com/fdisk-como-usarlo-en-linux/
