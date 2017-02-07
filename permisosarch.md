# Estructura básica de permisos en archivos

Hay 3 atributos básicos para archivos simples: lectura, escritura y ejecutar.

>> Permiso de lectura (read)
Si tienes permiso de lectura de un archivo, puedes ver su contenido.

>> Permiso de escritura (write)
Si tienes permiso de escritura de un archivo, puedes modificar el archivo. Puedes agregar, sobrescribir o borrar su contenido.

>> Permiso de ejecución (execute)
Si el archivo tiene permiso de ejecución, entonces puedes decirle al sistema operativo que lo ejecute como si fuera un programa. Si es un programa llamado “foo” lo podremos ejecutar como cualquier comando.
O un script (interprete) que necesita permiso de lectura y ejecución, un programa compilado solo necesita ser lectura.

Los caracteres atribuidos a los permisos son:
r quiere decir escritura y viene de Read
w quiere decir lectura y viene de Write
x quiere decir ejecución y viene de eXecute

Usando chmod para cambiar los permisos
chmod (change mode) es el comando utilizado para cambiar permisos, se pueden agregar o borrar permisos a uno o mas archivos con + (mas) o – (menos)

Para evitar el borrado accidental de un archivo importante, simplemente quita el permiso de escritura en tu “archivo” con el comando chmod

$ chmod -w tuArchivo

si quieres hacer un script ejecutable, escribe

$ chmod +x tuScript

si quieres borrar o agregar todos los atributos a la vez

$ chmod -rwx archivo
$ chmod +rwx archivo

también puedes usar el signo = (igual) para establecer los permisos en una combinación exacta, este comando borra los permisos de escritura y ejecución dejando solo el de lectura

$ chmod =r archivo

Cuidado con editar los permisos de tus archivos, si los editas no olvides dejarlos como estaban originalmente
2.- Estructura básica de permisos en directorios

En el caso de los directorios tenemos los mismo permisos, pero con un significado diferente.

>> Permiso de lectura en un directorio
Si un directorio tiene permiso de lectura, puedes ver los archivos que este contiene. Puedes usar un “ls (list directory)” para ver su contenido, que tengas permiso de lectura en un directorio no quiere decir que puedas leer el contenido de sus archivos si no tienes permiso de lectura en esos.

>> Permiso de escritura en un directorio.
Con el permiso de escritura puedes agregar, borrar o mover archivos al directorio

>> Permiso de ejecución en un directorio.
Ejecución te permite usar el nombre del directorio cuando estas accediendo a archivos en ese directorio, es decir este permiso lo hace que se tome en cuenta en búsquedas realizadas por un programa, por ejemplo, un directorio sin permiso de ejecución no seria revisado por el comando find
3.- Usuarios, Grupos y Otros

Ahora conocemos los 3 permisos y como agregar o borrar estos, pero estos 3 permisos son almacenados en 3 lugares diferentes llamados.
Usuario (u) proviene de user
Grupo (g) proviene de group
Otros (o) proviene de other

Cuando ejecutas

$ chmod =r archivo

Cambia los permisos en 3 lugares, cuando haces una lista de directorios con “ls -l” veras algo parecido a.

-r--r--r--    1  wada  users  4096 abr 13 19:30 archivo

nota esas 3 “r”s para los 3 diferentes tipos de permisos

donde:


|  permisos   |  pertenece  |  

|  rwx------  | usuario     |  
|  ---r-x---  | grupo       |  
|  ------r-x  | otros       |  


podemos borrar permisos para cada dueño; supongamos que tenemos un archivo:

-rwxr-xr-x    1  wada  users  4096 abr 13 19:30 archivo

Para borrar los permisos de ejecución a grupos y otros basta con usar:

$ chmod g-x,o-x archivo

nuestro archivo quedara con estos permisos

-rwxr--r--    1  wada  users  4096 abr 13 19:30 archivo

si deseas borrar a usuario el permiso de escritura:

$ chmod u-x archivo

-r-xr--r--    1  wada  users  4096 abr 13 19:30 archivo

Agregando y borrando dos permisos a la vez:

$ chmod u-x+w archivo

-rw-r--r--    1  wada  users  4096 abr 13 19:30 archivo


4.- chmod en octal

La representación octal de chmod es muy sencilla

Lectura tiene el valor de 4
Escritura tiene el valor de 2
Ejecución tiene el valor de 1

Entonces:

| rwx |  7  | Lectura, escritura y ejecución    |
| rw- |  6  | Lectura, escritura        |
| r-x |  5  | Lectura y ejecución       |
| r-- |  4  | Lectura               |
| -wx |  3  | Escritura y ejecución             |
| -w- |  2  | Escritura                         |
| --x |  1  | Ejecución             |
| --- |  0  | Sin permisos          |

Por lo tanto:

|chmod u=rwx,g=rwx,o=rx  | chmod 775 | 
|chmod u=rwx,g=rx,o=     | chmod 760 |
|chmod u=rw,g=r,o=r      | chmod 644 |
|chmod u=rw,g=r,o=       | chmod 640 |
|chmod u=rw,go=          | chmod 600 |
|chmod u=rwx,go=         | chmod 700 |
     
