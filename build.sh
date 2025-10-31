#!/bin/bash
# build.sh

IMAGE_NAME="react-app"

echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .
echo "Build is complete Now!"
