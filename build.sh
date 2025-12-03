#!/bin/bash

DOCKER_USER="gokulviveka"
IMAGE_NAME="devops-build-dev"
TAG="latest"

echo "Building Docker image..."
docker build -t $DOCKER_USER/$IMAGE_NAME:$TAG .

echo "Done: $DOCKER_USER/$IMAGE_NAME:$TAG"
