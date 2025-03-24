#!/bin/bash

echo "Building Docker image using docker-compose..."
docker-compose build

if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
else
    echo "Failed to build Docker image."
    exit 1
fi
