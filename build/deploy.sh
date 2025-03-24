#!/bin/bash

echo "Deploying Docker container using docker-compose..."
docker-compose up -d

if [ $? -eq 0 ]; then
    echo "Docker container deployed successfully."
else
    echo "Failed to deploy Docker container."
    exit 1
fi
