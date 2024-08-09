#!/bin/bash

# Set variables
NETWORK_NAME="metadata_meta"
CONTAINER_NAME="mongo"
IMAGE_NAME="mongo:latest"
DB_VOLUME_PATH="/root/metadata_crawler_docker/database"
RESULT_VOLUME_PATH="/root/metadata_crawler_docker/metadata/data"

# Check if the network exists, create if it doesn't
if ! docker network ls | grep -q "$NETWORK_NAME"; then
    docker network create --driver bridge "$NETWORK_NAME"
fi

# Stop and remove the existing container if it exists
if docker ps -a | grep -q "$CONTAINER_NAME"; then
    docker stop "$CONTAINER_NAME"
    docker rm "$CONTAINER_NAME"
fi

# Run the MongoDB container
docker run -d --name "$CONTAINER_NAME" --network "$NETWORK_NAME" \
    -v "$DB_VOLUME_PATH:/data/db" \
    -v "$RESULT_VOLUME_PATH:/result" \
    --restart unless-stopped \
    "$IMAGE_NAME"

# Check if the container is running
if docker ps | grep -q "$CONTAINER_NAME"; then
    echo "MongoDB container started successfully and connected to $NETWORK_NAME network."
else
    echo "Failed to start MongoDB container."
fi