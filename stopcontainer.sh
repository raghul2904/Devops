#!/bin/bash

CONTAINER_NAME="react-ecommerce-container"

# Check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping container: $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    echo "Container $CONTAINER_NAME stopped."
else
    echo "Container $CONTAINER_NAME is not running."
fi
