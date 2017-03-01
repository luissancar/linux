# Comandos Linux

## Información del sistema

arch: mostrar la arquitectura de la máquina (1).  
uname -m: mostrar la arquitectura de la máquina (2).  
uname -r: mostrar la versión del kernel usado.  
dmidecode -q: mostrar los componentes (hardware) del sistema.  
hdparm -i /dev/hda: mostrar las características de un disco duro.  
hdparm -tT /dev/sda: realizar prueba de lectura en un disco duro.  
cat /proc/cpuinfo: mostrar información de la CPU.  
cat /proc/interrupts: mostrar las interrupciones.  
cat /proc/meminfo: verificar el uso de memoria.  
cat /proc/swaps: mostrar ficheros swap.  
cat /proc/version: mostrar la versión del kernel.  
cat /proc/net/dev: mostrar adaptadores de red y estadísticas.  
cat /proc/mounts: mostrar el sistema de ficheros montado.  
lspci -tv: mostrar los dispositivos PCI.  
lsusb -tv: mostrar los dispositivos USB.  
date: mostrar la fecha del sistema.  
cal 2011: mostrar el almanaque de 2011.  
cal 07 2011: mostrar el almanaque para el mes julio de 2011.  Muestra/Modifica fecha y hora.

Su estructura es: date {mmddhhmiyyyy.ss}, donde:

mm – Mes

dd – Día

hh – Hora en formato 24hs.

mi – Minutos

yyyy – Año

ss – segundos

Ejemplos de uso:

date -s "01/31/2009 22:19:53" cambia la fecha y la hora.

date +%T -s "22:19:53" cambia la hora.

date --set "2007-05-27 17:27" cambia fecha y la hora. 

clock -w: guardar los cambios de fecha en la BIOS.  
## Apagar (Reiniciar Sistema o Cerrar Sesión)  

shutdown -h now: apagar el sistema (1).    
init 0: apagar el sistema (2).   
telinit 0: apagar el sistema (3).    
halt: apagar el sistema (4).  
shutdown -h hours:minutes &: apagado planificado del sistema.  
shutdown -c: cancelar un apagado planificado del sistema.  
shutdown -r now: reiniciar (1).  
reboot: reiniciar (2).  
logout: cerrar sesión.  

## Archivos y Directorios
cd /home: entrar en el directorio “home”.  
cd ..: retroceder un nivel.  
cd ../..: retroceder 2 niveles.  
cd: ir al directorio raíz.  
cd ~user1: ir al directorio user1.  
cd –: ir (regresar) al directorio anterior.  
pwd: mostrar el camino del directorio de trabajo.  
ls: ver los ficheros de un directorio.  
ls -F: ver los ficheros de un directorio.  
ls -l: mostrar los detalles de ficheros y carpetas de un directorio.  
ls -a: mostrar los ficheros ocultos.  
ls *[0-9]*: mostrar los ficheros y carpetas que contienen números.  
tree: mostrar los ficheros y carpetas en forma de árbol comenzando por la raíz.(1)  
lstree: mostrar los ficheros y carpetas en forma de árbol comenzando por la raíz.(2)  
mkdir dir1: crear una carpeta o directorio con nombre ‘dir1’.  
mkdir dir1 dir2: crear dos carpetas o directorios simultáneamente (Crear dos directorios a la vez).  
mkdir -p /tmp/dir1/dir2: crear un árbol de directorios.  
rm -f file1: borrar el fichero llamado ‘file1’.  
rmdir dir1: borrar la carpeta llamada ‘dir1’.  
rm -rf dir1: eliminar una carpeta llamada ‘dir1’ con su contenido de forma recursiva. (Si lo borro recursivo estoy diciendo que es con su contenido).  
rm -rf dir1 dir2: borrar dos carpetas (directorios) con su contenido de forma recursiva.  
mv dir1 new_dir: renombrar o mover un fichero o carpeta (directorio).  
cp file1: copiar un fichero.  
cp file1 file2: copiar dos ficheros al unísono.  
cp dir /* .: copiar todos los ficheros de un directorio dentro del directorio de trabajo actual.  
cp -a /tmp/dir1 .: copiar un directorio dentro del directorio actual de trabajo.  
cp -a dir1: copiar un directorio.  
cp -a dir1 dir2: copiar dos directorio al unísono.
ln -s file1 lnk1: crear un enlace simbólico al fichero o directorio.  
ln file1 lnk1: crear un enlace físico al fichero o directorio.  
touch -t 0712250000 file1: modificar el tiempo real (tiempo de creación) de un fichero o directorio.  
file file1: salida (volcado en pantalla) del tipo mime de un fichero texto.  
iconv -l: listas de cifrados conocidos.  
iconv -f fromEncoding -t toEncoding inputFile > outputFile: crea una nueva forma del fichero de entrada asumiendo que está codificado en fromEncoding y convirtiéndolo a ToEncoding.  
find . -maxdepth 1 -name *.jpg -print -exec convert ”{}” -resize 80×60 “thumbs/{}” \;: agrupar ficheros redimensionados en el directorio actual y enviarlos a directorios en vistas de miniaturas (requiere convertir desde ImagemagicK).


## Encontrar archivos
find / -name file1: buscar fichero y directorio a partir de la raíz del sistema.  
find / -user user1: buscar ficheros y directorios pertenecientes al usuario ‘user1’.  
find /home/user1 -name \*.bin: buscar ficheros con extensión ‘. bin’ dentro del directorio ‘/ home/user1’.  
find /usr/bin -type f -atime +100: buscar ficheros binarios no usados en los últimos 100 días.  
find /usr/bin -type f -mtime -10: buscar ficheros creados o cambiados dentro de los últimos 10 días.  
find / -name \*.rpm -exec chmod 755 ‘{}’ \;: buscar ficheros con extensión ‘.rpm’ y modificar permisos.  
find / -xdev -name \*.rpm: Buscar ficheros con extensión ‘.rpm’ ignorando los dispositivos removibles como cdrom, pen-drive, etc.…  
locate \*.ps: encuentra ficheros con extensión ‘.ps’ ejecutados primeramente con el command ‘updatedb’.  
whereis halt: mostrar la ubicación de un fichero binario, de ayuda o fuente. En este caso pregunta dónde está el comando ‘halt’.  
which halt: mostrar la senda completa (el camino completo) a un binario / ejecutable.

## Montando un sistema de ficheros
mount /dev/hda2 /mnt/hda2: montar un disco llamado hda2. Verifique primero la existencia del directorio ‘/ mnt/hda2’; si no está, debe crearlo.  
umount /dev/hda2: desmontar un disco llamado hda2. Salir primero desde el punto ‘/ mnt/hda2.  
fuser -km /mnt/hda2: forzar el desmontaje cuando el dispositivo está ocupado.  
umount -n /mnt/hda2: correr el desmontaje sin leer el fichero /etc/mtab. Útil cuando el fichero es de solo lectura o el disco duro está lleno.  
mount /dev/fd0 /mnt/floppy: montar un disco flexible (floppy).  
mount /dev/cdrom /mnt/cdrom: montar un cdrom / dvdrom.  
mount /dev/hdc /mnt/cdrecorder: montar un cd regrabable o un dvdrom.  
mount /dev/hdb /mnt/cdrecorder: montar un cd regrabable / dvdrom (un dvd).  
mount -o loop file.iso /mnt/cdrom: montar un fichero o una imagen iso.  
mount -t vfat /dev/hda5 /mnt/hda5: montar un sistema de ficheros FAT32.  
mount /dev/sda1 /mnt/usbdisk: montar un usb pen-drive o una memoria (sin especificar el tipo de sistema de ficheros).  

## Espacio de Disco
df -h: mostrar una lista de las particiones montadas.  
ls -lSr |more: mostrar el tamaño de los ficheros y directorios ordenados por tamaño.  
du -sh dir1: Estimar el espacio usado por el directorio ‘dir1’.  
du -sk * | sort -rn: mostrar el tamaño de los ficheros y directorios ordenados por tamaño.  
rpm -q -a –qf ‘%10{SIZE}t%{NAME}n’ | sort -k1,1n: mostrar el espacio usado por los paquetes rpm instalados organizados por tamaño (Fedora, Redhat y otros).  
dpkg-query -W -f=’${Installed-Size;10}t${Package}n’ | sort -k1,1n: mostrar el espacio usado por los paquetes instalados, organizados por tamaño (Ubuntu, Debian y otros).  

## Usuarios y Grupos
groupadd nombre_del_grupo: crear un nuevo grupo.  
groupdel nombre_del_grupo: borrar un grupo.  
groupmod -n nuevo_nombre_del_grupo viejo_nombre_del_grupo: renombrar un grupo.  
useradd -c “Name Surname ” -g admin -d /home/user1 -s /bin/bash user1: Crear un nuevo usuario perteneciente al grupo “admin”.  
useradd user1: crear un nuevo usuario.  
userdel -r user1: borrar un usuario (‘-r’ elimina el directorio Home).  
usermod -c “User FTP” -g system -d /ftp/user1 -s /bin/nologin user1: cambiar los atributos del usuario.  
passwd: cambiar contraseña.  
passwd user1: cambiar la contraseña de un usuario (solamente por root).  
chage -E 2011-12-31 user1: colocar un plazo para la contraseña del usuario. En este caso dice que la clave expira el 31 de diciembre de 2011.  
pwck: chequear la sintaxis correcta el formato de fichero de ‘/etc/passwd’ y la existencia de usuarios.  
grpck: chequear la sintaxis correcta y el formato del fichero ‘/etc/group’ y la existencia de grupos.  
newgrp group_name: registra a un nuevo grupo para cambiar el grupo predeterminado de los ficheros creados recientemente.  
Permisos en Ficheros (Usa ”+” para colocar permisos y ”-” para eliminar)

ls -lh: Mostrar permisos.  
ls /tmp | pr -T5 -W$COLUMNS: dividir la terminal en 5 columnas.  
chmod ugo+rwx directory1: colocar permisos de lectura ®, escritura (w) y ejecución(x) al propietario (u), al grupo (g) y a otros (o) sobre el directorio ‘directory1’.  
chmod go-rwx directory1: quitar permiso de lectura ®, escritura (w) y (x) ejecución al grupo (g) y otros (o) sobre el directorio ‘directory1’.  
chown user1 file1: cambiar el dueño de un fichero.  
chown -R user1 directory1: cambiar el propietario de un directorio y de todos los ficheros y directorios contenidos dentro.  
chgrp group1 file1: cambiar grupo de ficheros.  
chown user1:group1 file1: cambiar usuario y el grupo propietario de un fichero.  
find / -perm -u+s: visualizar todos los ficheros del sistema con SUID configurado.  
chmod u+s /bin/file1: colocar el bit SUID en un fichero binario. El usuario que corriendo ese fichero adquiere los mismos privilegios como dueño.  
chmod u-s /bin/file1: deshabilitar el bit SUID en un fichero binario.  
chmod g+s /home/public: colocar un bit SGID en un directorio –similar al SUID pero por directorio.
chmod g-s /home/public: desabilitar un bit SGID en un directorio.  
chmod o+t /home/public: colocar un bit STIKY en un directorio. Permite el borrado de ficheros solamente a los dueños legítimos.  
chmod o-t /home/public: desabilitar un bit STIKY en un directorio.  
Atributos especiales en ficheros (Usa ”+” para colocar permisos y ”-” para eliminar)  

chattr +a file1: permite escribir abriendo un fichero solamente modo append.  
chattr +c file1: permite que un fichero sea comprimido / descomprimido automáticamente.  
chattr +d file1: asegura que el programa ignore borrar los ficheros durante la copia de seguridad.  
chattr +i file1: convierte el fichero en invariable, por lo que no puede ser eliminado, alterado, renombrado, ni enlazado.  
chattr +s file1: permite que un fichero sea borrado de forma segura.  
chattr +S file1: asegura que un fichero sea modificado, los cambios son escritos en modo synchronous como con sync.  
chattr +u file1: te permite recuperar el contenido de un fichero aún si este está cancelado.  
lsattr: mostrar atributos especiales.  

## Archivos y Ficheros comprimidos
bunzip2 file1.bz2: descomprime in fichero llamado ‘file1.bz2’.  
bzip2 file1: comprime un fichero llamado ‘file1’.
gunzip file1.gz: descomprime un fichero llamado ‘file1.gz’.  
gzip file1: comprime un fichero llamado ‘file1’.  
gzip -9 file1: comprime con compresión máxima.  
rar a file1.rar test_file: crear un fichero rar llamado ‘file1.rar’.  
rar a file1.rar file1 file2 dir1: comprimir ‘file1’, ‘file2’ y ‘dir1’ simultáneamente.  
rar x file1.rar: descomprimir archivo rar.  
unrar x file1.rar: descomprimir archivo rar.  
  
Archivos .tar.gz:
Comprimir: tar -czvf empaquetado.tar.gz /carpeta/a/empaquetar/  
Descomprimir: tar -xzvf archivo.tar.gz  
  
Archivos .tar:  
Empaquetar: tar -cvf paquete.tar /dir/a/comprimir/  
Desempaquetar: tar -xvf paquete.tar  
  
Archivos .gz:  
Comprimir: gzip -9 index.php  
Descomprimir: gzip -d index.php.gz  
  
Archivos .zip:  
Comprimir: zip archivo.zip carpeta  
Descomprimir: unzip archivo.zip  
  
.
Paquetes RPM (Red Hat, Fedora y similares)  

rpm -ivh package.rpm: instalar un paquete rpm.  
rpm -ivh –nodeeps package.rpm: instalar un paquete rpm ignorando las peticiones de dependencias.  
rpm -U package.rpm: actualizar un paquete rpm sin cambiar la configuración de los ficheros.  
rpm -F package.rpm: actualizar un paquete rpm solamente si este está instalado.  
rpm -e package_name.rpm: eliminar un paquete rpm.
rpm -qa: mostrar todos los paquetes rpm instalados en el sistema.  
rpm -qa | grep httpd: mostrar todos los paquetes rpm con el nombre “httpd”.  
rpm -qi package_name: obtener información en un paquete específico instalado.  
rpm -qg “System Environment/Daemons”: mostar los paquetes rpm de un grupo software.  
rpm -ql package_name: mostrar lista de ficheros dados por un paquete rpm instalado.  
rpm -qc package_name: mostrar lista de configuración de ficheros dados por un paquete rpm instalado.  
rpm -q package_name –whatrequires: mostrar lista de dependencias solicitada para un paquete rpm.  
rpm -q package_name –whatprovides: mostar la capacidad dada por un paquete rpm.  
rpm -q package_name –scripts: mostrar los scripts comenzados durante la instalación /eliminación.  
rpm -q package_name –changelog: mostar el historial de revisions de un paquete rpm.  
rpm -qf /etc/httpd/conf/httpd.conf: verificar cuál paquete rpm pertenece a un fichero dado.  
rpm -qp package.rpm -l: mostrar lista de ficheros dados por un paquete rpm que aún no ha sido instalado.  
rpm –import /media/cdrom/RPM-GPG-KEY: importar la firma digital de la llave pública.  
rpm –checksig package.rpm: verificar la integridad de un paquete rpm.  
rpm -qa gpg-pubkey: verificar la integridad de todos los paquetes rpm instalados.  
rpm -V package_name: chequear el tamaño del fichero, licencias, tipos, dueño, grupo, chequeo de resumen de MD5 y última modificación.  
rpm -Va: chequear todos los paquetes rpm instalados en el sistema. Usar con cuidado.  
rpm -Vp package.rpm: verificar un paquete rpm no instalado todavía.  
rpm2cpio package.rpm | cpio –extract –make-directories *bin*: extraer fichero ejecutable desde un paquete rpm.  
rpm -ivh /usr/src/redhat/RPMS/`arch`/package.rpm: instalar un paquete construido desde una fuente rpm.  
rpmbuild –rebuild package_name.src.rpm: construir un paquete rpm desde una fuente rpm.  
Actualizador de paquetes YUM (Red Hat, Fedora y similares)  

yum install package_name: descargar e instalar un paquete rpm.  
yum localinstall package_name.rpm: este instalará un RPM y tratará de resolver todas las dependencies para ti, usando tus repositorios.  
yum update package_name.rpm: actualizar todos los paquetes rpm instalados en el sistema.  
yum update package_name: modernizar / actualizar un paquete rpm.  
yum remove package_name: eliminar un paquete rpm.  
yum list: listar todos los paquetes instalados en el sistema.  
yum search package_name: Encontrar un paquete en repositorio rpm.  
yum clean packages: limpiar un caché rpm borrando los paquetes descargados.  
yum clean headers: eliminar todos los ficheros de encabezamiento que el sistema usa para resolver la dependencia.  
yum clean all: eliminar desde los paquetes caché y ficheros de encabezado.  

## Paquetes Deb (Debian, Ubuntu y derivados)
dpkg -i package.deb: instalar / actualizar un paquete deb.  
dpkg -r package_name: eliminar un paquete deb del sistema.  
dpkg -l: mostrar todos los paquetes deb instalados en el sistema.  
dpkg -l | grep httpd: mostrar todos los paquetes deb con el nombre “httpd”  
dpkg -s package_name: obtener información en un paquete específico instalado en el sistema.  
dpkg -L package_name: mostar lista de ficheros dados por un paquete instalado en el sistema.  
dpkg –contents package.deb: mostrar lista de ficheros dados por un paquete no instalado todavía.  
dpkg -S /bin/ping: verificar cuál paquete pertenece a un fichero dado.  

## Actualizador de paquetes APT (Debian, Ubuntu y derivados)
apt-get install package_name: instalar / actualizar un paquete deb.  
apt-cdrom install package_name: instalar / actualizar un paquete deb desde un cdrom.  
apt-get update: actualizar la lista de paquetes.  
apt-get upgrade: actualizar todos los paquetes instalados.  
apt-get remove package_name: eliminar un paquete deb del sistema.  
apt-get check: verificar la correcta resolución de las dependencias.  
apt-get clean: limpiar cache desde los paquetes descargados.  
apt-cache search searched-package: retorna lista de paquetes que corresponde a la serie «paquetes buscados».  

## Ver el contenido de un fichero
cat file1: ver los contenidos de un fichero comenzando desde la primera hilera.  
tac file1: ver los contenidos de un fichero comenzando desde la última línea.  
more file1: ver el contenido a lo largo de un fichero.  
less file1: parecido al commando ‘more’ pero permite salvar el movimiento en el fichero así como el movimiento hacia atrás.  
head -2 file1: ver las dos primeras líneas de un fichero.  
tail -2 file1: ver las dos últimas líneas de un fichero.  
tail -f /var/log/messages: ver en tiempo real qué ha sido añadido al fichero.  

## Manipulación de texto
cat file1 file2 .. | command <> file1_in.txt_or_file1_out.txt: sintaxis general para la manipulación de texto utilizando PIPE, STDIN y STDOUT.  
cat file1 | command( sed, grep, awk, grep, etc…) > result.txt: sintaxis general para manipular un texto de un fichero y escribir el resultado en un fichero nuevo.  
cat file1 | command( sed, grep, awk, grep, etc…) » result.txt: sintaxis general para manipular un texto de un fichero y añadir resultado en un fichero existente.  
grep Aug /var/log/messages: buscar palabras “Aug” en el fichero ‘/var/log/messages’.  
grep ^Aug /var/log/messages: buscar palabras que comienzan con “Aug” en fichero ‘/var/log/messages’  
grep [0-9] /var/log/messages: seleccionar todas las líneas del fichero ‘/var/log/messages’ que contienen números.  
grep Aug -R /var/log/*: buscar la cadena “Aug” en el directorio ‘/var/log’ y debajo.  
sed ‘s/stringa1/stringa2/g’ example.txt: reubicar “string1” con “string2” en ejemplo.txt  
sed ‘/^$/d’ example.txt: eliminar todas las líneas en blanco desde el ejemplo.txt  
sed ‘/ *#/d; /^$/d’ example.txt: eliminar comentarios y líneas en blanco de ejemplo.txt  
echo ‘esempio’ | tr ‘[:lower:]’ ‘[:upper:]’: convertir minúsculas en mayúsculas.  
sed -e ‘1d’ result.txt: elimina la primera línea del fichero ejemplo.txt  
sed -n ‘/stringa1/p’: visualizar solamente las líneas que contienen la palabra “string1”.  

## Establecer caracter y conversión de ficheros
dos2unix filedos.txt fileunix.txt: convertir un formato de fichero texto desde MSDOS a UNIX.  
unix2dos fileunix.txt filedos.txt: convertir un formato de fichero de texto desde UNIX a MSDOS.  
recode ..HTML < page.txt > page.html: convertir un fichero de texto en html.  
recode -l | more: mostrar todas las conversiones de formato disponibles.  

## Análisis del sistema de ficheros
badblocks -v /dev/hda1: Chequear los bloques defectuosos en el disco hda1.  
fsck /dev/hda1: reparar / chequear la integridad del fichero del sistema Linux en el disco hda1.  
fsck.ext2 /dev/hda1: reparar / chequear la integridad del fichero del sistema ext 2 en el disco hda1.  
e2fsck /dev/hda1: reparar / chequear la integridad del fichero del sistema ext 2 en el disco hda1.  
e2fsck -j /dev/hda1: reparar / chequear la integridad del fichero del sistema ext 3 en el disco hda1.  
fsck.ext3 /dev/hda1: reparar / chequear la integridad del fichero del sistema ext 3 en el disco hda1.  
fsck.vfat /dev/hda1: reparar / chequear la integridad del fichero sistema fat en el disco hda1.  
fsck.msdos /dev/hda1: reparar / chequear la integridad de un fichero del sistema dos en el disco hda1.  
dosfsck /dev/hda1: reparar / chequear la integridad de un fichero del sistema dos en el disco hda1.  

## Formatear un sistema de ficheros
mkfs /dev/hda1: crear un fichero de sistema tipo Linux en la partición hda1.  
mke2fs /dev/hda1: crear un fichero de sistema tipo Linux ext 2 en hda1.  
mke2fs -j /dev/hda1: crear un fichero de sistema tipo Linux ext3 (periódico) en la partición hda1.  
mkfs -t vfat 32 -F /dev/hda1: crear un fichero de sistema FAT32 en hda1.  
fdformat -n /dev/fd0: formatear un disco flooply.  
mkswap /dev/hda3: crear un fichero de sistema swap.

## Trabajo con la SWAP
mkswap /dev/hda3: crear fichero de sistema swap.
swapon /dev/hda3: activando una nueva partición swap.  
swapon /dev/hda2 /dev/hdb3: activar dos particiones swap.  

## Copias seguridad (Backup)
dump -0aj -f /tmp/home0.bak /home: hacer una copia de seguridad completa del directorio ‘/home’.  
dump -1aj -f /tmp/home0.bak /home: hacer una copia de seguridad incremental del directorio ‘/home’.  
restore -if /tmp/home0.bak: restaurando una copia de seguridad interactivamente.  
rsync -rogpav –delete /home /tmp: sincronización entre directorios.  
rsync -rogpav -e ssh –delete /home ip_address:/tmp: rsync a través del túnel SSH.  
rsync -az -e ssh –delete ip_addr:/home/public /home/local: sincronizar un directorio local con un directorio remoto a través de ssh y de compresión.  
rsync -az -e ssh –delete /home/local ip_addr:/home/public: sincronizar un directorio remoto con un directorio local a través de ssh y de compresión.  
dd bs=1M if=/dev/hda | gzip | ssh user@ip_addr ‘dd of=hda.gz’: hacer una salva de un disco duro en un host remoto a través de ssh.  
dd if=/dev/sda of=/tmp/file1: salvar el contenido de un disco duro a un fichero. (En este caso el disco duro es “sda” y el fichero “file1”).  
tar -Puf backup.tar /home/user: hacer una copia de seguridad incremental del directorio ‘/home/user’.  
( cd /tmp/local/ && tar c . ) | ssh -C user@ip_addr ‘cd /home/share/ && tar x -p’: copiar el contenido de un directorio en un directorio remoto a través de ssh.  
( tar c /home ) | ssh -C user@ip_addr ‘cd /home/backup-home && tar x -p’: copiar un directorio local en un directorio remoto a través de ssh.  
tar cf – . | (cd /tmp/backup ; tar xf – ): copia local conservando las licencias y enlaces desde un directorio a otro.  
find /home/user1 -name ‘*.txt’ | xargs cp -av –target-directory=/home/backup/ –parents: encontrar y copiar todos los ficheros con extensión ‘.txt’ de un directorio a otro.  
find /var/log -name ‘*.log’ | tar cv –files-from=- | bzip2 > log.tar.bz2: encontrar todos los ficheros con extensión ‘.log’ y hacer un archivo bzip.  
dd if=/dev/hda of=/dev/fd0 bs=512 count=1: hacer una copia del MRB (Master Boot Record) a un disco floppy.  
dd if=/dev/fd0 of=/dev/hda bs=512 count=1: restaurar la copia del MBR (Master Boot Record) salvada en un floppy.  

## CD-ROM
cdrecord -v gracetime=2 dev=/dev/cdrom -eject blank=fast -force: limpiar o borrar un cd regrabable.  
mkisofs /dev/cdrom > cd.iso: crear una imagen iso de cdrom en disco.  
mkisofs /dev/cdrom | gzip > cd_iso.gz: crear una imagen comprimida iso de cdrom en disco.  
mkisofs -J -allow-leading-dots -R -V “Label CD” -iso-level 4 -o ./cd.iso data_cd: crear una imagen iso de un directorio.  
cdrecord -v dev=/dev/cdrom cd.iso: quemar una imagen iso.  
gzip -dc cd_iso.gz | cdrecord dev=/dev/cdrom –: quemar una imagen iso comprimida.  
mount -o loop cd.iso /mnt/iso: montar una imagen iso.  
cd-paranoia -B: llevar canciones de un cd a ficheros wav.  
cd-paranoia – ”-3”: llevar las 3 primeras canciones de un cd a ficheros wav.  
cdrecord –scanbus: escanear bus para identificar el canal scsi.  
dd if=/dev/hdc | md5sum: hacer funcionar un md5sum en un dispositivo, como un CD.  

## Trabajo con la RED ( LAN y Wi-Fi)
ifconfig eth0: mostrar la configuración de una tarjeta de red Ethernet.  
ifup eth0: activar una interface ‘eth0’.  
ifdown eth0: deshabilitar una interface ‘eth0’.  
ifconfig eth0 192.168.1.1 netmask 255.255.255.0: configurar una dirección IP.  
ifconfig eth0 promisc: configurar ‘eth0’en modo común para obtener los paquetes (sniffing).  
dhclient eth0: activar la interface ‘eth0’ en modo dhcp.  
route -n: mostrar mesa de recorrido.  
route add -net 0/0 gw IP_Gateway: configurar entrada predeterminada.  
route add -net 192.168.0.0 netmask 255.255.0.0 gw 192.168.1.1: configurar ruta estática para buscar la red ‘192.168.0.0/16’.  
route del 0/0 gw IP_gateway: eliminar la ruta estática.  
echo “1” > /proc/sys/net/ipv4/ip_forward: activar el recorrido ip.  
hostname: mostrar el nombre del host del sistema.  
host www.example.com: buscar el nombre del host para resolver el nombre a una dirección ip(1).  
nslookup www.example.com: buscar el nombre del host para resolver el nombre a una direccióm ip y viceversa(2).  
ip link show: mostar el estado de enlace de todas las interfaces.  
mii-tool eth0: mostar el estado de enlace de ‘eth0’.  
ethtool eth0: mostrar las estadísticas de tarjeta de red ‘eth0’.  
netstat -tup: mostrar todas las conexiones de red activas y sus PID.  
netstat -tupl: mostrar todos los servicios de escucha de red en el sistema y sus PID.  
tcpdump tcp port 80: mostrar todo el tráfico HTTP.
iwlist scan: mostrar las redes inalámbricas.  
iwconfig eth1: mostrar la configuración de una tarjeta de red inalámbrica.  
whois www.example.com: buscar en base de datos Whois.  

## Redes de Microsoft Windows (SAMBA)
nbtscan ip_addr: resolución de nombre de red bios.  
nmblookup -A ip_addr: resolución de nombre de red bios.  
smbclient -L ip_addr/hostname: mostrar acciones remotas de un host en windows.  

## Tablas IP (CORTAFUEGOS)
iptables -t filter -L: mostrar todas las cadenas de la tabla de filtro.  
iptables -t nat -L: mostrar todas las cadenas de la tabla nat.  
iptables -t filter -F: limpiar todas las reglas de la tabla de filtro.  
iptables -t nat -F: limpiar todas las reglas de la tabla nat.  
iptables -t filter -X: borrar cualquier cadena creada por el usuario.  
iptables -t filter -A INPUT -p tcp –dport telnet -j ACCEPT: permitir las conexiones telnet para entar.  
iptables -t filter -A OUTPUT -p tcp –dport http -j DROP: bloquear las conexiones HTTP para salir.
iptables -t filter -A FORWARD -p tcp –dport pop3 -j ACCEPT: permitir las conexiones POP a una cadena delantera.  
iptables -t filter -A INPUT -j LOG –log-prefix “DROP INPUT”: registrando una cadena de entrada.
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE: configurar un PAT (Puerto de traducción de dirección) en eth0, ocultando los paquetes de salida forzada.  
iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp -m tcp –dport 22 -j DNAT –to-destination 10.0.0.2:22: redireccionar los paquetes diriguidos de un host a otro.  

## Monitoreando y depurando
top: mostrar las tareas de linux usando la mayoría cpu.  
ps -eafw: muestra las tareas Linux.  
ps -e -o pid,args –forest: muestra las tareas Linux en un modo jerárquico.  
pstree: mostrar un árbol sistema de procesos.  
kill -9 ID_Processo: forzar el cierre de un proceso y terminarlo.  
kill -1 ID_Processo: forzar un proceso para recargar la configuración.  
lsof -p $$: mostrar una lista de ficheros abiertos por procesos.  
lsof /home/user1: muestra una lista de ficheros abiertos en un camino dado del sistema.  
strace -c ls >/dev/null: mostrar las llamadas del sistema hechas y recibidas por un proceso.  
strace -f -e open ls >/dev/null: mostrar las llamadas a la biblioteca.  
watch -n1 ‘cat /proc/interrupts’: mostrar interrupciones en tiempo real.  
last reboot: mostrar historial de reinicio.
lsmod: mostrar el kernel cargado.  
free -m: muestra el estado de la RAM en megabytes.
smartctl -A /dev/hda: monitorear la fiabilidad de un disco duro a través de SMART.  
smartctl -i /dev/hda: chequear si SMART está activado en un disco duro.  
tail /var/log/dmesg: mostrar eventos inherentes al proceso de carga del kernel.  
tail /var/log/messages: mostrar los eventos del sistema.  

## Otros comandos útiles
apropos …keyword: mostrar una lista de comandos que pertenecen a las palabras claves de un programa; son útiles cuando tú sabes qué hace tu programa, pero de sconoces el nombre del comando.  
man ping: mostrar las páginas del manual on-line; por ejemplo, en un comando ping, usar la opción ‘-k’ para encontrar cualquier comando relacionado.  
whatis …keyword: muestra la descripción de lo que hace el programa.  
mkbootdisk –device /dev/fd0 `uname -r`: crear un floppy boteable.  
gpg -c file1: codificar un fichero con guardia de seguridad GNU.  
gpg file1.gpg: decodificar un fichero con Guardia de seguridad GNU.  
wget -r www.example.com: descargar un sitio web completo.  
wget -c www.example.com/file.iso: descargar un fichero con la posibilidad de parar la descargar y reanudar más tarde.  
echo ‘wget -c www.example.com/files.iso‘ | at 09:00: Comenzar una descarga a cualquier hora. En este caso empezaría a las 9 horas.  
ldd /usr/bin/ssh: mostrar las bibliotecas compartidas requeridas por el programa ssh.  
alias hh=’history’: colocar un alias para un commando –hh= Historial.  
chsh: cambiar el comando Shell.  
chsh –list-shells: es un comando adecuado para saber si tienes que hacer remoto en otra terminal.  
who -a: mostrar quien está registrado, e imprimir hora del último sistema de importación, procesos muertos, procesos de registro de sistema, procesos activos producidos por init, funcionamiento actual y últimos cambios del reloj del sistema.
#grep  
El comando grep nos permite buscar, dentro de los archivos, las líneas que concuerdan con un patrón. Bueno, si no especificamos ningún nombre de archivo, tomará la entrada estándar, con lo que podemos encadenarlo con otros filtros.

Por defecto, grep imprime las líneas encontradas en la salida estándar. Es decir, que podemos verlo directamente la pantalla, o redireccionar la salida estándar a un archivo.

Como tiene muchísimas opciones, vamos a ver tan sólo las más usadas:

-c En lugar de imprimir las líneas que coinciden, muestra el número de líneas que coinciden.
-e PATRON nos permite especificar varios patrones de búsqueda o proteger aquellos patrones de búsqueda que comienzan con el signo -.
-r busca recursivamente dentro de todos los subdirectorios del directorio actual.
-v nos muestra las líneas que no coinciden con el patrón buscado.
-i ignora la distinción entre mayúsculas y minúsculas.
-n Numera las líneas en la salida.
-E nos permite usar expresiones regulares. Equivalente a usar egrep.
-o le indica a grep que nos muestre sólo la parte de la línea que coincide con el patrón.
-f ARCHIVO extrae los patrones del archivo que especifiquemos. Los patrones del archivo deben ir uno por línea.
-H nos imprime el nombre del archivo con cada coincidencia.

Veamos algunos ejemplos:

- Buscar todas las líneas que contengan palabras que comiencen por a en un archivo:
$ grep '\<a.*\>' archivo

Otra forma de buscar, sería:
$ cat archivo | grep "\<a.*\>" 

- Mostrar por pantalla, las líneas que contienen comentarios en el archivo /boot/grub/menu.lst:
$ grep "#" /boot/grub/menu.lst

- Enviar a un fichero las líneas del archivo /boot/grub/menu.lst que no son comentarios:
$ grep -v "#" /boot/grub/menu.lst

- Contar el número de interfaces de red que tenemos definidos en el fichero /etc/network/interfaces:
$ grep -c "iface" /etc/network/interfaces

- Mostrar las líneas de un fichero que contienen la palabra BADAJOZ o HUELVA:
$ grep -e "BADAJOZ" -e "HUELVA" archivo

- Mostrar las líneas de un fichero que contienen la palabra BADAJOZ o HUELVA, numerando las líneas de salida:
$ grep -n -e "BADAJOZ" -e "HUELVA" archivo

- Mostrar los ficheros que contienen la palabra TOLEDO en el directorio actual y todos sus subdirectorios:
$ grep -r "TOLEDO" *

Veamos algunos ejemplos con expresiones regulares:

- Obtener la dirección MAC de la interfaz de red eth0 de nuestra máquina:
$ ifconfig eth0 | grep -oiE '([0-9A-F]{2}:){5}[0-9A-F]{2}'

Sacamos la dirección MAC de la interfaz eth0 de nuestra máquina haciendo un:
ifconfig eth0

Y aplicando el filtro grep:
grep -oiE '([0-9A-F]{2}:){5}[0-9A-F]{2}'

Las opciones que he usado en grep son:

-o Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
-i Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
-E Indica que vamos a usar una expresión regular extendida.

En cuanto a la expresión regular, podemos dividirla en dos partes:
([0-9A-F]{2}:){5} Buscamos 5 conjuntos de 2 carateres seguidos de dos puntos
[0-9A-F]{2} seguido por un conjunto de dos caracteres.

Como las direcciones MAC se representan en hexadecimal, los caracteres que buscamos son los números del 0 al 9 y las letras desde la A a la F.

- Extraer la lista de direcciones de correo electrónico de un archivo:
grep -Eio '[a-z0-9._-]+@[a-z0-9.-]+[a-z]{2,4}' fichero.txt

Utilizo las mismas opciones que en el caso anterior:

-o Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
-i Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
-E Indica que vamos a usar una expresión regular extendida.

Analicemos ahora la expresión regular:
[a-z0-9._-]+@[a-z0-9.-]+[a-z]{2,4}

Al igual que antes, la vamos dividiendo en partes:
[a-z0-9._-]+ Una combinación de letras, números, y/o los símbolos . _ y - de uno o más caracteres
@ seguido de una arroba
[a-z0-9.-]+ seguido de una cadena de letras, números y/o los símbolos . y -
[a-z]{2,4} seguido de una cadena de entre dos y cuatro caracteres.

- Obtener la dirección IP de la interfaz de red eth1 de nuestra máquina:
$ ifconfig eth1 | grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v 255

En el ejemplo anterior, hemos tomado la información que nos ofrece ifconfig:
ifconfig eth1

Hemos filtrado dicha información con el comando grep, obteniendo todas las direcciones IP que aparecen:
grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}'

Por último, hemos filtrado la salida del comando anterior, para eliminar la dirección de broadcast junto con la máscara de red para quedarnos sólo con la dirección IP de la máquina:
grep -v 255

La línea anterior no mostraría las líneas que no contengan el valor 255, es decir, las direcciones de broadcast y máscara de red.

Analicemos ahora el comando grep:
grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}'

Al igual que en los otros dos ejemplos de expresiones regulares uso las opciones -oiE en el comando grep:

-o Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
-i Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
-E Indica que vamos a usar una expresión regular extendida.

En cuanto a la expresión regular:
'([0-9]{1,3}\.){3}[0-9]{1,3}'
([0-9]{1,3}\.){3} Representa 3 bloques de entre uno y tres dígitos separados por puntos. Observemos que como el punto es un metacaracter, tengo que usar el caracter de escape \ para que no sea interpretado como un metacaracter, sino como un caracter normal.
[0-9]{1,3} Representa el último bloque de la dirección IP, que está formado por un número de entre 1 y 3 dígitos.  


# gawk  
awk o la versión GNU gawk es más que un simple comando de procesamiento de patrones, es todo un lenguaje de análisis semántico.   

Una línea típica de /etc/passwd es como la siguiente:  
```
luis:x:504:504:Luis Hernandez:/home/luis:/bin/bash  
```
Bien, supongamos que deseamos un listado de todos los usuarios normales (personas) del sistema, pero solo necesitamos su nombre de usuario, su nombre o real y su shell por defecto, es decir, si vemos la línea anterior, la separación entre campos es ":" asi que para nuestra consulta  queremos el campo 1,5 y 7. Pero además, esta consulta será parte de una tabla HTML, asi que deberiamos incluir las etquietas "<tr> y "<td> necesarias de una vez. Es decir, el resultado deseado es el siguiente:  
```
<tr><td>luis<td><td>Luis Hernandez</td><td>/bin/bash</td></tr>  
```
El primer paso es determinar los usuarios normales del sistema, podríamos usar un grep "home" /etc/passw | gawk ..., pero podría haber usuarios que tengan su HOME en otra ubicación, además se trata de usar solo awk, asi que lo primero que entenderemos es que los campos obtenidos del resultado de un comando awk, se numeran por $1, $2, etc. y el delimitador de campos se indica mediante la variable "FS".  
```
> gawk '{print $3}' FS=":" /etc/passwd  
0  
1  
2  
...  
81  
86  
500  
501  
502  
503  
504  
```
Podemos ver como seleccionamos el caracter separador FS=":", que viene de 'Field Separator', y tenemos indicada una acción '{print $3}', que significa imprime el campo 3. Aunque realmente no lo queremos imprimir, lo queremos evaluar, y si deseamos imprimir el $1, $5 y $7 que se mencionarion previamente, asi que agregamos una expresión de evaluación antes de la acción:  
```
> awk '$3 >= 500 {print $1 $5 $7 }' FS=":" /etc/passwd  
sergonSergio Gonzalez/bin/bash  
valeriaValeria Perez/bin/bash  
```

Agregamos '$3 >= 500' previo a la acción (que es imprimir lo que deseamos). Nótese que los campos en el resultado salen pegados, es necesario agregar entre comillas " ", ya sea un espacio o lo que se desee, en este caso etiquetas de tablas de HTML y además ordenaremos "sort" los registros obtenidos:  
```
> awk  '$3 >= 500 {print "<tr><td>"$1"</td><td>"$5"</td><td>"$7"</td></tr>" | "sort" }' FS=":" /etc/passwd  
<tr><td>alejandra</td><td>Alejandra Lopez</td><td>/bin/nologin</td></tr>  
<tr><td>fernanda</td><td>Fernanda Lozano</td><td>/bin/sh</td></tr>  
<tr><td>luis</td><td>Luis Hernandez</td><td>/bin/bash</td></tr>  
```
