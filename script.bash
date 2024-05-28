#!/bin/bash

# Actualizar el sistema
sudo yum update -y

# Instalar Apache
sudo yum install httpd -y

# Habilitar Apache en segundo plano
sudo systemctl start httpd
sudo systemctl enable httpd

# Instalar la librería net-tools
sudo yum install net-tools -y

# Filtrar las líneas que contienen "inet" o "inet6" en la salida de ifconfig y guardarlas en un archivo
ifconfig | grep -E "inet|inet6" > info_red.txt

# Leer el contenido del archivo en una variable
info_red=$(cat info_red.txt)
id=$(uuidgen)

# Generar el contenido HTML con la variable que contiene la información de red
html_content="
<!DOCTYPE html>
<html>
<head>
  <title>Saludos desde Linux y AWS</title>
</head>
<body>
  <h1>Saludos desde Linux y AWS</h1>
  <h2>Información de red:</h2>
  <pre>$info_red</pre>
  <p><strong>Random:ID:</strong>$id</p>
</body>
</html>
"

# Guardar el contenido HTML en un archivo
echo "$html_content" > /var/www/html/index.html

# Reiniciar el servidor Apache para aplicar los cambios
sudo systemctl restart httpd
