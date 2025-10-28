#debes completar este archivo con los comandos necesarios para provisionar la base de datos
#!/usr/bin/env bash

# Actualizar paquetes
sudo apt-get update -y

# Instalar PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Habilitar el servicio
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Crear base de datos, usuario y tabla de ejemplo
sudo -u postgres psql <<EOF
CREATE DATABASE reto_db;
CREATE USER vagrant WITH PASSWORD 'vagrant';
GRANT ALL PRIVILEGES ON DATABASE reto_db TO vagrant;

\connect reto_db
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(50)
);

INSERT INTO empleados (nombre, cargo) VALUES
('Juan Pérez', 'Desarrollador'),
('María Gómez', 'Diseñadora'),
('Carlos Ruiz', 'Analista');
EOF
