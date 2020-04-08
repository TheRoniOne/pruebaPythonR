# pruebaPythonR

Este es un repo de pruebas que busca crear un flujo entre Python y R
Python sera usado para hacer la llamada a R por medio de un subproceso
El script tmb instala las librerias necesarias de R (tidyverse, jsonlite)

Para probar el script de R, ejecutar el comando:
Rscript prueba.R "direccion del folder donde se encuentra el json de telecom" "telecom.csv" "direccion del folder destino"

Ejemplo:
Rscript prueba.R "D:/Datos de Usuario/rgamezv/Downloads/prueba" "telecom.json" "D:/Datos de Usuario/rgamezv/Downloads/resultadoPrueba"

Para ejecutar el script de Python, ejecutar el comando:
python prueba.py "D:/Datos de Usuario/rgamezv/Downloads/prueba" "telecom.json" "D:/Datos de Usuario/rgamezv/Downloads/resultadoPrueba"