#!/bin/bash
# Delete the containers
docker rm -f task2-app task2-redis

# Delete network bridge
docker network rm task2-network

# Delete the image
docker rmi -f task2-image
