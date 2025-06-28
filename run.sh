#!/bin/sh
#
# User-friendly entry point for PostgreSQL Co-Pilot
#

set -e

# Get the current user's UID and GID
export CURRENT_UID=$(id -u)
export CURRENT_GID=$(id -g)


echo "Starting PostgreSQL Co-Pilot..."
# Create the data directory and all necessary subdirectories for the container volume
echo "Creating local data directories..."
mkdir -p ./data/config
mkdir -p ./data/memory/feedback
mkdir -p ./data/memory/insights
mkdir -p ./data/memory/schema
mkdir -p ./data/memory/conversation_history
mkdir -p ./data/memory/lancedb_stores
mkdir -p ./data/approved_sql
echo "Pulling latest image..."
docker pull shivam124/postgres-copilot:latest
echo "Running container..."
docker run -it --rm -v "$(pwd)/data":/home/appuser/data -e POSTGRES_COPILOT_DATA_DIR=/home/appuser/data shivam124/postgres-copilot:latest
