#!/usr/bin/env bash

echo "===== PROVISIONAMIENTO DE LA MÁQUINA WEB INICIADO ====="

# Actualizar paquetes
echo "Actualizando paquetes del sistema..."
sudo apt-get update -y

# Instalar Apache y PHP
echo "Instalando Apache y PHP..."
sudo apt-get install -y apache2 php libapache2-mod-php

# Habilitar Apache al inicio del sistema
echo "Habilitando y arrancando el servicio Apache..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Crear carpeta compartida si no existe
if [ ! -d "/vagrant/www" ]; then
    echo "Creando carpeta compartida /vagrant/www..."
    sudo mkdir -p /vagrant/www
fi

# Copiar archivos del proyecto (HTML y PHP)
echo "Copiando archivos del proyecto a /var/www/html..."
sudo rm -rf /var/www/html/*
sudo cp -r /vagrant/www/* /var/www/html/

# Asignar permisos al usuario del servidor web
echo "Ajustando permisos..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Reiniciar Apache por si se hicieron cambios
sudo systemctl restart apache2

echo "===== PROVISIONAMIENTO DE LA MÁQUINA WEB COMPLETADO EXITOSAMENTE ====="
