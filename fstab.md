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
/dev/sda1    ntfs             /mnt/windows-xp  XXXXXXXXXXXXXXXX
/dev/sda2    ext4             /                XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sda3    ext4             /home            XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sda6    swap             <swap>           XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sda5    ext4             /mnt/data        XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sdb1    ext2             (not mounted)    XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
/dev/sdc1    vfat             (not mounted)    XXXX-XXXX
~~~


