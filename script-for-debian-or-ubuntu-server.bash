#!/bin/bash

# Actualizar el sistema
sudo apt update -y

# Instalar Apache
sudo apt install apache2 -y

sudo apt install git -y

# Habilitar Apache en segundo plano
sudo systemctl start httpd
sudo systemctl enable httpd

# Filtrar las líneas que contienen "inet" o "inet6" en la salida de ifconfig y guardarlas en un archivo
ip address | grep inet > info_red.txt

# Leer el contenido del archivo en una variable
info_red=$(cat info_red.txt)

# Generar el contenido HTML con la variable que contiene la información de red
html_content="
<!DOCTYPE html>
<html>
<head>
  <title> Linux Server </title>
</head>
<body>
  <h1>Bienvenidos a mi Web Server en Google Cloud!!!</h1>
  <h2>Informacion de red:</h2>
  <pre>$info_red</pre>
</body>
</html>
"

# Guardar el contenido HTML en un archivo
echo "$html_content" > /var/www/html/index.html

# Reiniciar el servidor Apache para aplicar los cambios
sudo systemctl restart apache2
