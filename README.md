# README

# Requisitos: 

Linux: Tener Instalado docker y git
Windows: debes tener instalado WSL con alguna distro a eleccion,  git y ademas docker desktop


## 1 - Clonar Proyecto y entrar al directorio

git clone https://github.com/FelipeCarrascoLopez/waypoint_api-rails.git

cd waypoint_api-rails


## 1 - Configuración del Entorno

Crear un archivo `.env` en el directorio raíz del proyecto con las siguientes variables de entorno:

POSTGRES_USER=postgresql
POSTGRES_PASSWORD=postgresql
POSTGRES_HOST=db

despues crear el archivo .env con:

touch .env

abrir archivo (ctrl + x, despues enter para guardar:
nano .env

Comprobar los datos:
cat .env

## 2 - Leventar servicios con docker

con este comando creamos y levantamos los servicios del contenedor a partir del docker-compose.yml

docker compose up --build

api con swagger: http://localhost:3000/api-docs/

![image](https://github.com/user-attachments/assets/481fe5f7-14b8-47c1-800a-fddbe6c8092c)
