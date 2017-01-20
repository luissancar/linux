# Estructura de archivos Linux.  

/BIN

El directorio /bin es un directorio estático y es donde se almacenan todos los binarios necesarios para garantizar las funciones básicas a nivel de usuario. Solo almacena los ejecutables de usuario, ya que los binarios necesarios para tareas administrativas gestionadas por el usuario root o superusuario del sistema se encuentran en el directorio /sbin.

Incluye también los binarios que permiten la ejecución de varias utilidades estándar de la terminal de Linux, concretamente cat, cd, cp, echo, grep, gzip, kill, ls, mv, rm, ping, su, ps, tar y vi.

/BOOT

Es un directorio estático e incluye todos los ejecutables y archivos que son necesarios en el proceso de arranque del sistema, y que deberán ser utilizados antes que que el kernel empiece a dar las órdenes de ejecución de los diferentes módulos del sistema. Es también donde se encuentra el gestor de arranque GRUB.

En algunas distribuciones, es común que ese directorio se almacene en su propia partición separada del resto. Esto suele darse sobretodo en el caso de de que utilicen LVM por defecto, ya que tradicionalmente el gestor de arranque GRUB (en versiones anteriores a la 2) no podía arrancar desde LVM, por lo que se requería que estuviera en una partición separada.

De hecho, si en una instalación normal de Ubuntu o Debian optas por utilizar LVM, verás que el instalador ya te genera un esquema de particiones con el directorio boot en una partición aparte.

En estos casos es importante prever bien el espacio que le vayas a dar a la partición, ya que a la larga, con la acumulación de diferentes actualizaciones del Kernel, es común que se quede sin espacio y debas hacer limpieza de versiones antiguas del kernel. En este post que te acabo de enlazar lo tienes explicado con más detalle.

/DEV

Este directorio incluye todos los dispositivos de almacenamiento, en forma de archivos, conectados al sistema, es decir, cualquier disco duro conectado, partición, memoria USB, o CDROM conectado al sistema y que el sistema pueda entender como un volumen lógico de almacenamiento.

Siendo esto así, verás que la ruta en la que se encuentra cualquier volumen (partición o dispositivo externo) conectado al sistema siempre empieza por /dev. Este es el directorio que contiene, por decirlo de algún modo, la información de cada uno de los volúmenes, a diferencia del directorio /media, que verás más adelante, que lo que contiene son solo los puntos de montaje, pero no la información real de estos volúmenes.

Para ver esto en la práctica, si abres una ventana de terminal y ejecutas el comando sudo fdisk -l, verás la estructura de particiones de tu sistema. En una instalación típica de cualquier distro GNU/Linux suele ser la siguiente:

/dev/sda1 - Partición principal
/dev/sda2 - Partición extendida 
/dev/sda5 - Partición Swap
La partición sda1 suele ser la partición principal, Obviamente si has editado manualmente el esquema de particiones, en tu caso será diferente, esto es solo un ejemplo típico para ayudar a explicar la función del directorio /dev.

Eso en cuanto a particiones. Si se trata de un dispositivo externo, el volumen estará igualmente dentro de /dev, pero en este caso varía el nombre que el sistema le asigna a dicho volumen. Generalmente la estructura suele ser la siguiente (si ejecutas nuevamente el comando sudo fdisl -l con un dispositivo externo conectado lo podrás comprobar tu mismo).

/dev/sdb1
/dev/sdb2
/dev/sdb3
...
/ETC

Es el encargado de almacenar los archivos de configuración tanto a nivel de componentes del sistema operativo en sí, como de los programas y aplicaciones instaladas a posteriori.

Es un directorio que debería contener únicamente archivos de configuración, y no debería contener binarios.

/HOME

Es el directorio de los usuarios estándar, y por lo tanto, el destinado a almacenar todos los archivos del usuario, como documentos, fotos, vídeos, música, plantillas, etc. También incluye archivos temporales de aplicaciones ejecutadas en modo usuario, que sirven para guardar las configuraciones de programas, etc.

Dentro /home hay los directorios personales de todos los usuarios, nombrados según el nombre de usuario utilizado. Así por ejemplo, si en un sistema pongamos que hay dos usuarios denominados User1 y User2, la estructura será así:

/home/User1
/home/User2
Cada directorio de usuario contiene asimismo diferentes carpetas para ayudarlo a clasificar la información. Estas generalmente son: /Documentos, /Imágenes, /Música, /Plantillas y /Vídeos /, así como otros archivos y carpetas ocultas, que son las encargados de guardar la información de configuraciones de las aplicaciones del usuario.

Para visualizar los ficheros ocultos dentro del directorio individual de cada usuario, puedes hacerlo rápidamente mediante la combinación de comandos CTRL + F. Por cierto, y muy importante, todas los archivos y carpetas ocultas en Linux empiezan por un punto, seguido del nombre de la carpeta.

En muchas distribuciones es una práctica recomendada el hecho de ubicar el directorio /home es una partición separada del resto, por tal de facilitar que, en caso de reinstalar el sistema operativo, puedas mantener intacta la partición de la /home, y de este modo mantener todos los archivos personales.

/LIB

Incluye las bibliotecas esenciales  que son necesarios para que se puedan ejecutar correctamente todos los binarios que se encuentran en los directorios /bin y /sbin, así como los módulos del propio kernel.

En los sistemas operativos de 64 bits, además de /lib existe otro directorio denominado /lib64, referida a las bibliotecas para aplicaciones de 64 bits.

/MEDIA

Representa el punto de montaje de todos los volúmenes lógicos que se montan temporalmente, ya sean unidades externas USB, otras particiones de disco, etc.

En la mayoría de distribuciones GNU/Linux, desde hace ya algún tiempo, cada vez que se monta una unidad externa, partición, etc., esta se monta dentro del directorio /media y a su vez dentro de un directorio especifico dependiendo del usuario del sistema que monta el volumen.

De este modo, si en un sistema hay varios usuarios, pongamos User1 y User2, los puntos de montaje de los volúmenes que montan cada uno de ellos se mostraran en directorios separados tal como así:

/media/User1
/media/User2
/MNT

Es un directorio vacío que cumple funciones similares a /media, pero que actualmente no se suele utilizar, ya que la mayoría de distribuciones hacen uso de este último para los puntos de montaje temporales.

/OPT

En cierto modo vendría a ser como una extensión del directorio /usr, pero en este caso van todos aquellos archivos de solo lectura que son parte de programas auto-contenidos y que, por lo tanto, no siguen los estándares de almacenar los diferentes archivos dentro de los diferentes subdirectorios de /usr (que sería lo recomendable)

Haciendo una analogía con Windows, vendría a ser algo como el directorio de “Archivos y Programas”, pero en este caso, como hemos dicho, para determinados programas que ya vienen auto-contenidos.

/PROC

Este directorio contiene información de los procesos y aplicaciones que se están ejecutando en un momento determinado en el sistema, pero realmente no guarda nada como tal, ya que lo que almacena son archivos virtuales, por lo que el contenido de este directorio es nulo.

Básicamente son listas de eventos del sistema operativo que se generan en el momento de acceder a ellos, y que no existen dentro del directorio como tales.

En este enlace de LinuxTotal tienes información más detallada sobre las particularidades de este directorio y todo el juego que le puedes sacar a la hora de obtener información muy diversa del sistema.

/ROOT

Vendría a ser como el directorio /home del usuario root o superusuario del sistema. A diferencia de los otros usuarios, que se encuentran todos dentro de /home en sus respectivas subcarpetas, el directorio del usuario root está en su propia carpeta colgando directamente de la raíz del sistema.

/SBIN

Si hemos dicho que en /bin se almacenaban los binarios relativos a las funciones normales de usuario, /sbin hace lo mismo pero para los binarios relativos tareas propias del sistema operativo, y que solamente pueden ser gestionadas por el usuario root, tales como el arranque, tareas de restauración, reparación, etc.

/SRV

Sirve para almacenar archivos y directorios relativos a servidores que puedas tener instalados dentro de tu sistema, ya sea un servidor web www, un servidor FTP, CVS, etc. Así, por ejemplo, en el caso de tener instalado un servidor web, sería buena idea tener el directorio web público dentro de /srv, tal como así:

/srv/www
/SYS

Al igual que /proc, contiene archivos virtuales que proveen información del kernel relativa a eventos del sistema operativo. Es en cierto modo una evolución de /proc, y a diferencia de este último, los archivos se distribuyen de forma jerárquica.

/TMP

Como ya da a entender su nombre, sirve para almacenar archivos temporales de todo tipo, ya sea de elementos del sistema, o también de diferentes aplicaciones a nivel de usuario como puedan ser Firefox o Chrome/Chromium.

Es un directorio dispuesto para almacenar contenido de corta durada, de hecho en la gran mayoría de los casos se suele vaciar de forma automática en cada reinicio del sistema. Aun así, no debes borrar su contenido de forma manual, puesto que puede contener archivos necesarios para ciertos programas o procesos que estén ejecutándose.

Las aplicaciones programadas para almacenar archivos en este directorio deben asumir que solo serán recuperables en la sesión actual. En este sentido, hay otro subdirectorio, /var/tmp, dispuesto igualmente para el almacenamiento de archivos temporales, pero cuyo contenido no se borra de forma automática tras el reinicio del sistema.

/USR

El directorio /usr viene de “User System Resources” y actualmente sirve para almacenar todos los archivos de solo lectura y relativos a las utilidades de usuario, incluyendo todo el software instalado a través de los gestores de paquetes de cada distribución. Contiene los siguientes subdirectorios:

/usr/bin
/usr/include
/usr/lib
/usr/local
/usr/sbin
/usr/share
/usr/src
Antiguamente /usr también contenía la carpeta particular de usuario, junto con todos sus documentos, vídeos, fotos, etc., pero más adelante se creó el directorio /home para este propósito, dejando /usr reservado para los archivos relativos a programas.

/VAR

contiene varios archivos con información del sistema, como archivos de logs, emails de los usuarios del sistema, bases de datos, información almacenada en la caché, información relativa a los paquetes de aplicaciones almacenados en /opt, etc. En cierto modo se podría decir que actúa a modo de registro del sistema.
