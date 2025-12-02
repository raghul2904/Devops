#!/bin/bash

IMAGE="gokulviveka/devops-build-prod:latest"

echo "Pulling latest image..."
docker pull $IMAGE

echo "Stopping old container..."
docker stop web || true
docker rm web || true

echo "Starting new container..."
docker run -d -p 80:80 --name web $IMAGE

echo "Deployment done!"
