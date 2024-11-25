#!/bin/bash
set -e

echo "Esperando a que la base de datos esté disponible..."
until nc -z $DATABASE_HOST 5432; do
  echo "Base de datos no disponible, reintentando en 2 segundos..."
  sleep 2
done

# Si el comando incluye 'sidekiq', salta las migraciones
if [[ "$@" =~ "sidekiq" ]]; then
  echo "Iniciando Sidekiq sin ejecutar migraciones..."
else
  echo "Creando la base de datos (si es necesario)..."
  bundle exec rails db:create || echo "La base de datos ya existe."

  echo "Aplicando migraciones..."
  bundle exec rails db:migrate
fi

echo "Iniciando la aplicación..."
exec "$@"
