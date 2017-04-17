# Particiones
El fichero fstab (file systems table) se encuentra comúnmente en sistemas Unix (en el directorio /etc/) como parte de la configuración del sistema. Lo más destacado de este fichero es la lista de discos y particiones disponibles.   
Definiciones:  
- FileSystem: Todo medio físico que pueda almacenar archivos debe tener un filesystem para ser capaz de cumplir dicha función (ejemplo: una partición de un disco duro). Un filesystem es un sistema utilizado para organizar los archivos en dicho medio de almacenamiento.
- Tipo de filesystem: Como ya vimos un filesystem es un sistema de organización  y es razonable que hayan varios sistemas distintos para organizar los archivos, cada uno con sus pro y sus contras. Por ejemplo: FAT, NTFS, EXT2, EXT3, EXT4, etc.  
- Punto de Montaje: El punto de montaje es una carpeta o directorio. Después de montarse el filesystem en dicho directorio podremos acceder a los archivos mediante él (directorio).  
- Opciones de montaje: Permiten especificar ciertos parámetros para que al montarse el filesystem se haga de una forma especial, por ejemplo: ro (read-only) esto hace que no se puedan crear, modificar ni borrar archivos en ese filesystem. Otro ejemplo: errors=remount-ro (remount as read-only) en caso de algun error grave, el filesystem se monta en modo read-only.  
## El fichero /etf/fstab  
En este archivo cada una de las lineas hace referencia a un sistema de archivos (filesystem) y cada una de éstas respetan la siguiente estructura:  
~~~
UUID=d4f1ec7e-f3d3-4bd4-becf-4f6da208237f  /  ext3  errors=remount-ro  0  1  
/dev/sda5  /home  ext3  defaults  0  2  
~~~
En la primera linea se utiliza el UUID (Identificador Universal Único) del filesystem y en la segunda la ruta del mismo (no el punto de montaje). Si utilizamos el UUID, nuestro método sera mucho mas robusto.  
Para obtener el UUID debemos ejecutar como root el siguiente comando:

sudo blkid  (nos devolverá algo como):  
~~~
$ sudo blkid -o list
device       fs_type label    mount point      UUID
-----------------------------------------------------------------------------------
UUID=d4f1ec7e-f3d3-4bd4-becf-4f6da208237f    ntfs             /mnt/windows-xp  XXXXXXXXXXXXXXXX
/dev/sda2    ext4             /                XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sda3    ext4             /home            XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sda6    swap             <swap>           XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sda5    ext4             /mnt/data        XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sdb1    ext2             (not mounted)    XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sdc1    vfat             (not mounted)    XXXX-XXXX
~~~

Un ejemplo de fstab sería:  
~~~
# /etc/fstab: static file system information.
#
# file system   mount point     type    options         dump    pass
/dev/sda1       /boot           ext4    defaults        1       2
/dev/sda5       /               ext4    defaults        1       1
/dev/sda6       /home           ext4    defaults        0       0
/dev/sda7       /storage        ext4    defaults        1       2
/dev/sda8       swap            swap    defaults        0       0
~~~
Las líneas que comienzan con # son ignoradas como en la mayoría de los archivos de configuración de Linux por tratarse de comentarios. Por lo tanto, la parte interesante arranca a partir de la cuarta línea. Se puede ver que cada una de las líneas del archivo representan un filesystem distinto. A su vez, es sencillo notar que todas las líneas presentan seis columnas cada una, cuyo significado se detalla a continuación:  

- Primera: en este campo se indica el dispositivo o la partición donde se encuentra el filesystem.  
- Segunda: aquí va el punto de montaje para el dispositivo especificado.  
- Tercera: el tipo de sistema de archivos. Puede tomar varios valores, entre los que se destacan: ext2, ext3, ext4, iso9660, nfs, ntfs, reiserfs, smbfs, swap, vfat, xfs.  
- Cuarta: en esta columna van las opciones para el montaje del filesystem. Son muchas y a continuación se mencionan las más comunes.  
  - async: las escrituras al filesystem se demoran, es decir que no se hacen en el momento sino que se hacen varias escrituras juntas. Esto da un mayor rendimiento, aunque si el sistema se cuelga, apaga o el filesystem se desmonta, los datos se pederán si aún no han sido escritos.
  - auto: el sistema de archivos será montado automáticamente al iniciar el sistema o al ejecutar el comando mount -a.
  - noauto: debe ser montado explícitamente.
  - defaults: utiliza las opciones por defecto, que son rw, suid, dev, exec, auto, nouser, async.
  - ro: monta el filesystem como de sólo lectura.
  - rw: monta el filesystem como lectura/escritura.
  - user: permite que cualquier usuario pueda montar el filesystem.
  - nouser: especifica que el filesystem sólo puede ser montado por el usuario root y no por un usuario común.
  - sync: todas las escrituras al filesystem se hacen en el momento. Esto da mayor seguridad a los datos pero un menor rendimiento.
- Quinta: esta columna indica a la utilidad dump si debe o no hacer backup del filesystem. Puede tomar dos valores: 0 y 1. Con 0 se indica que no se debe backupear, con 1 que sí se haga. Lógicamente, depende de que se tenga instalado y configurado dump, por lo que en la mayoría de los casos este campo es 0.
- Sexta: en este caso se trata de una indicación para el fsck (comando que chequea el filesystem) y nuevamente se define con un valor numérico. Las posibilidades son 0, 1 y 2. El 0 indica que el filesystem no debe ser chequeado, mientras que el 1 y el 2 le dicen a fsck que sí lo chequee. La diferencia es que el 1 representa una prioridad mayor que el 2, por lo que debe utilizarse para el sistema raíz y el 2 para el resto de los sistemas de archivos.  
## mount umount
Para montar manualmente una partición sería:  
~~~
mount punto de montaje
~~~

Para desmontar manualmente una partición sería:  
~~~
umount punto de montaje
~~~
