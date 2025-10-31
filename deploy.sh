#!/bin/bash

IMAGE_NAME="react-app"
CONTAINER_NAME="react-app-container"

echo "Stopping old container (if exists)..."
docker rm -f $CONTAINER_NAME || true

echo "Starting new container..."
docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME

echo "Container Ready!"
docker ps


