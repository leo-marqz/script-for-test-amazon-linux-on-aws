#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
sudo apt install git -y
sudo systemctl start apache2
sudo systemctl enable apache2

ip address | grep inet > info_red.txt

info_red=$(cat info_red.txt)

html_content="
<!DOCTYPE html>
<html>
<head>
  <title> Linux Server </title>
</head>
<body>
  <h1>Bienvenidos a mi sitio web!!</h1>
  <h2>Informacion de red:</h2>
  <pre>$info_red</pre>
</body>
</html>
"

echo "$html_content" > /var/www/html/index.html

sudo systemctl restart apache2
