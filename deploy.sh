#!/bin/bash

set -e

echo "Starting deployment..."

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
COMPOSE_FILE="docker-compose.prod.yml"
CONTAINER_NAME="huseyinkarakaya-prod"

echo -e "${YELLOW}Pulling latest changes...${NC}"
git pull origin main || echo -e "${YELLOW}Git pull failed or not needed${NC}"

echo -e "${YELLOW}Stopping existing containers...${NC}"
docker compose -f $COMPOSE_FILE down || true

echo -e "${YELLOW}Building production image...${NC}"
docker compose -f $COMPOSE_FILE build --no-cache

echo -e "${YELLOW}Starting containers...${NC}"
docker compose -f $COMPOSE_FILE up -d

echo -e "${YELLOW}Waiting for container to be healthy...${NC}"
sleep 5

# Wait for health check
TIMEOUT=60
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    if docker inspect --format='{{.State.Health.Status}}' $CONTAINER_NAME 2>/dev/null | grep -q "healthy"; then
        echo -e "${GREEN}Container is healthy!${NC}"
        break
    fi
    echo -n "."
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $ELAPSED -ge $TIMEOUT ]; then
    echo -e "${RED}Container health check timeout!${NC}"
    docker compose -f $COMPOSE_FILE logs --tail=50
    exit 1
fi

echo -e "${YELLOW}Cleaning up old images...${NC}"
docker image prune -f

echo -e "${GREEN}Deployment completed successfully!${NC}"
echo -e "${GREEN}Application is running on port 3000${NC}"
echo ""
echo "Useful commands:"
echo "  View logs:    docker compose -f $COMPOSE_FILE logs -f"
echo "  Stop:         docker compose -f $COMPOSE_FILE down"
echo "  Restart:      docker compose -f $COMPOSE_FILE restart"
