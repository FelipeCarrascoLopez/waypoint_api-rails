#!/bin/bash
set -e

echo "Esperando a que la base de datos esté disponible..."
until nc -z $DATABASE_HOST 5432; do
  echo "Base de datos no disponible, reintentando en 2 segundos..."
  sleep 2
done

echo "Creando la base de datos (si es necesario)..."
bundle exec rails db:create || echo "La base de datos ya existe."

echo "Aplicando migraciones..."
bundle exec rails db:migrate

echo "Iniciando la aplicación..."
exec "$@"
