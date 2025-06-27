#!/bin/sh
#
# User-friendly entry point for PostgreSQL Co-Pilot
#

set -e

# Get the current user's UID and GID
export CURRENT_UID=$(id -u)
export CURRENT_GID=$(id -g)

# Check for docker-compose
if ! command -v docker-compose &> /dev/null
then
    echo "ERROR: docker-compose could not be found. Please install it."
    exit 1
fi

echo "Starting PostgreSQL Co-Pilot..."
docker-compose up --build --remove-orphans
