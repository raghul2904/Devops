#!/bin/bash

IMAGE="madhusudhan143/prod:latest"
CONTAINER="react-prod"

echo "🛑 Stopping existing container (if running)..."
docker stop $CONTAINER 2>/dev/null
docker rm $CONTAINER 2>/dev/null

echo "🐳 Pulling latest production image from Docker Hub..."
docker pull $IMAGE

echo "🚀 Starting new container..."
docker run -d -p 80:80 --name $CONTAINER $IMAGE

echo "✅ Deployment complete. App is live on port 80."

