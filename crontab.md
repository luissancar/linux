# CRONTAB  

El comando crontab se utiliza en sistemas UNIX para programar la ejecución de otros comandos, es decir, para automatizar tareas. Podemos ver los crontabs que se están programados y también editarlos.

Para verlos, editaremos el fichero /etc/crontab  

## FORMATO DE LAS TAREAS 

Las tareas cron siguen una determinada sintaxis. Tienen 5 asteriscos seguidos del comando a ejecutar.
~~~
* * * * * root /bin/ejecutar/script.sh  
~~~
De izquierda a derecha, los asteriscos representan:  
- Minutos: de 0 a 59.  
- Horas: de 0 a 23.  
- Día del mes: de 1 a 31.  
- Mes: de 1 a 12.  
- Día de la semana: de 0 a 6, siendo 0 el domingo.  
Si se deja un asterisco, quiere decir "cada" minuto, hora, día de mes, mes o día de la semana. Por ejemplo:  
~~~
* * * * * root /bin/ejecutar/script.sh
~~~
El usuario root ejecuta este script:  
Cada minuto  
De cada hora  
De cada día del mes  
De cada mes  
De cada día de la semana  
  
  
~~~
30 2 * * 1 user01 /bin/ejecutar/script.sh  
~~~
El usuario user01 ejecuta este script:  
En el minuto 30  
De las 2 de la noche  
De cada día del mes  
De cada mes  
Sólo si es lunes 


~~~
30 2 * * 1-3 /home/usertest/scripts/test1.sh
~~~
Ejecutar un script de lunes a miércoles a las 2:30 horas:

~~~
30 17 * * 1,5 /home/usuario/scripts/test1.sh
~~~

Se ejecutará a las 5:30 de la tarde todos los  lunes y viernes.


~~~
0,10,20,30,40,50 2 * * * /home/usertest/scripts/test1.sh
# ó
*/10 2 * * * /home/usertest/scripts/test1.sh
~~~

Ejecutar un script  cada 10 minutos desde las 2:00 horas durante una hora:
