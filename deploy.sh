#!/usr/bin/env bash
set -euo pipefail

REMOTE_USER="${1:-ubuntu}"
REMOTE_HOST="${2:-YOUR_SERVER_IP}"
SSH_KEY="${3:-~/.ssh/id_rsa}"
COMPOSE_FILE="${4:-docker-compose.yml}"
IMAGE_NAME="${5:-GOKUL_DOCKERHUB_USER/devops-build}"
TAG="${6:-latest}"

# Tag & push handled by CI normally. Here we pull & run on remote
echo "Deploying ${IMAGE_NAME}:${TAG} to ${REMOTE_USER}@${REMOTE_HOST}"

ssh -i "${SSH_KEY}" -o StrictHostKeyChecking=no "${REMOTE_USER}@${REMOTE_HOST}" bash -s <<EOF
  set -e
  # ensure docker is installed on remote (CI should've prepared server)
  docker pull ${IMAGE_NAME}:${TAG}
  # create a minimal docker-compose to run the pulled image
  cat > /home/${REMOTE_USER}/deploy-docker-compose.yml <<YAML
version: "3.8"
services:
  app:
    image: ${IMAGE_NAME}:${TAG}
    ports:
      - "80:80"
    restart: unless-stopped
YAML
  docker compose -f /home/${REMOTE_USER}/deploy-docker-compose.yml up -d --remove-orphans
EOF

echo "Deployment done."
