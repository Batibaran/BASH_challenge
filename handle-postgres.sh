#!/bin/bash



# Define environment variables

POSTGRES_PASSWORD="admin"

POSTGRES_DB="database_name"



# Check if the PostgreSQL container is already running

if [ "$(docker ps -q -f name=postgres)" ]; then

    echo "PostgreSQL is already running."

else

    # Create a Docker Compose file

    cat <<EOL > docker-compose.yml

version: '3'

services:

  postgres:

    image: postgres

    container_name: postgres

    environment:

      POSTGRES_PASSWORD: $POSTGRES_PASSWORD

      POSTGRES_DB: $POSTGRES_DB

    ports:

      - "5432:5432"

EOL



    # Start the PostgreSQL container with Docker Compose

    docker-compose up -d



    echo "PostgreSQL is now running."

fi

