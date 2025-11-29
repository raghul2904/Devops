#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-gokulviveka/devops-build}"
TAG="${2:-latest}"

echo "Building ${IMAGE_NAME}:${TAG}"
docker build -t "${IMAGE_NAME}:${TAG}" .

echo "Done: ${IMAGE_NAME}:${TAG}"
