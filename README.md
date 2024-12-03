# README

# Tener Instalado docker si ocupas Windows debes tener instalado WSL con alguna distro a eleccion y ademas docker desktop

git clone https://github.com/FelipeCarrascoLopez/waypoint_api-rails.git

cd waypoint_api-rails



## 1 - Configuración del Entorno

Crea un archivo `.env` en el directorio raíz del proyecto con las siguientes variables de entorno:

copiar este codigo:

POSTGRES_USER=postgresql
POSTGRES_PASSWORD=postgresql
POSTGRES_HOST=db

despues crear archivo con:

touch .env

abrir archivo:
nano .env

Comprobar los datos:
cat .env

## 2 - Leventar servicios con docker

con este comando levantamos creamos y levantamos los servicios del contenedor a partir del docker-compose.yml

docker compose up --build

api con swagger: http://localhost:3000/api-docs/

![image](https://github.com/user-attachments/assets/481fe5f7-14b8-47c1-800a-fddbe6c8092c)
