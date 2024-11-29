#!/bin/bash
set -e

echo "Esperando a que la base de datos esté disponible..."
until nc -z $DATABASE_HOST 5432; do
  echo "Base de datos no disponible, reintentando en 2 segundos..."
  sleep 2
done

if [[ "$@" =~ "sidekiq" ]]; then
  echo "Iniciando Sidekiq sin ejecutar migraciones..."
else
  echo "Creando la base de datos (si es necesario)..."
  bundle exec rails db:create || echo "La base de datos ya existe."

  echo "Aplicando migraciones..."
  max_retries=5
  attempt=0
  while [ $attempt -lt $max_retries ]; do
    if bundle exec rails db:migrate; then
      echo "Migraciones aplicadas correctamente."
      break
    else
      echo "Error de concurrencia en las migraciones. Reintentando en 5 segundos..."
      attempt=$((attempt + 1))
      sleep 5
    fi
  done

  if [ $attempt -eq $max_retries ]; then
    echo "No se pudieron aplicar las migraciones después de $max_retries intentos."
    exit 1
  fi
fi

echo "Iniciando la aplicación..."
exec "$@"
