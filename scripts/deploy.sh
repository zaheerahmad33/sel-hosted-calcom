#!/bin/bash

set -e
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    curl -fsSL https://get.docker.com | bash -
else
    echo "Docker is already installed."
fi

# Check Docker version
docker --version

# Check docker-compose version
docker compose version

cd calcom/nginx-proxy
sudo docker network create stack

echo "Stopping and removing existing docker-compose containers..."
sudo docker compose down || true  # Continue on error (if no containers are running)

echo "Starting docker-compose..."
sudo docker compose up -d