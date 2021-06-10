#!/bin/sh

# Wait for postgres to be ready
while ! PGPASSWORD=$POSTGRES_PASSWORD pg_isready -h "db" -U "$POSTGRES_USER" -d "$POSTGRES_DB" > /dev/null 2> /dev/null; do
  echo "Waiting for database to be ready ..."
  sleep 5
done

>&2 echo "Database is ready!"

export DATABASE_URL=postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@db:5432/$POSTGRES_DB
export DATABASE_DIALECT=postgres
export NODE_ENV=production

node ./build/worker.js
