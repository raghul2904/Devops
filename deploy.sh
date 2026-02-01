#!/bin/bash

set -e

IMAGE_NAME=react-app:latest
CONTAINER_NAME=app

echo "Stopping old container (if exists)..."
docker rm -f $CONTAINER_NAME || true

echo "Starting new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 80:80 \
  $IMAGE_NAME
