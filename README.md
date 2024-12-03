# Requisitos

### Linux
- Tener instalado:
  - Docker
  - Git

### Windows
- Tener instalado:
  - WSL con una distribución de Linux a elección.
  - Git
  - Docker Desktop

---

## 1. Clonar el Proyecto y Entrar al Directorio

Ejecuta los siguientes comandos en tu terminal:

git clone https://github.com/FelipeCarrascoLopez/waypoint_api-rails.git cd waypoint_api-rails


---

## 2. Configuración del Entorno

1. Crear un archivo `.env` en el directorio raíz del proyecto con las siguientes variables de entorno:

POSTGRES_USER=postgresql POSTGRES_PASSWORD=postgresql POSTGRES_HOST=db


2. Crear el archivo `.env`:

touch .env


3. Abrir y editar el archivo con el comando:

nano .env

- Guardar y salir: Presiona `Ctrl + X`, luego `Enter`.

4. Comprobar que los datos se guardaron correctamente:

cat .env


---

## 3. Levantar Servicios con Docker

1. Crear y levantar los servicios del contenedor utilizando el archivo `docker-compose.yml`:

docker compose up --build



2. Una vez iniciados los servicios, la API estará disponible con Swagger en:  
[http://localhost:3000/api-docs/](http://localhost:3000/api-docs/)

---

## Vista de Ejemplo
![Vista de Swagger](https://github.com/user-attachments/assets/481fe5f7-14b8-47c1-800a-fddbe6c8092c)



