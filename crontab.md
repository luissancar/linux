# CRONTAB  

El comando crontab se utiliza en sistemas UNIX para programar la ejecución de otros comandos, es decir, para automatizar tareas. Podemos ver los crontabs que se están programados y también editarlos.

Para verlos, editaremos el fichero /etc/crontab  

## FORMATO DE LAS TAREAS 

Las tareas cron siguen una determinada sintaxis. Tienen 5 asteriscos seguidos del comando a ejecutar.
* * * * * root /bin/ejecutar/script.sh  
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
Sólo si es viernes 
