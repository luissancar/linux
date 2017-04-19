# Ejercicio fstab  
A una máquina virtual de linux añadirle dos discos duros:
- disco A
  - Crear las siguientes particiones:
    - Linux
    - Fat
- disco B
  - Crear las siguientes particiones:
    - Linux
    - NTFS
    - Fat
    
Para particionar un disco nuevo y formatearlos se utiliza fdisk.  
Modificar el fichero fstab, añadiendo todas las particiones. Las del disco A se montarán manualmente. Las del disco B se montarán automáticamente al arrancar.  

# Ejercicios cron.  
- Cada hora en punto ejecutamos la sincronización horaria y mandamos la salida a /dev/null/
- Programar un trabajo (A) para ejecutarse en el minuto 30 de cada hora de cada día.
- Programar un trabajo (B) para ejecutarse cada día a las 20:30h.
- Programar un trabajo (C) para ejecutarse de lunes a viernes a las 20:30h.
- Programar un trabajo (D) para ejecutarse los martes y los jueves a las 20:30h.
- Programar un trabajo (E) para ejecutarse los días 10 y 20 de todos los meses a las 20:30h.
- Programar un trabajo (F) para ejecutarse cada 15 minutos.
- Programar un trabajo (G) para ejecutarse cada día a las 00:00h.
- Programar un trabajo (H) para ejecutarse cada primer día de mes a las 00:00h.
El trabajo que se debe ejecutar es:  
Añadir al fichero /etc/trabajos (no existe hay que crearlo) el código del trabajo y la hora de ejecución.  

      
