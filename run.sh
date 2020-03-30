#!/bin/bash
# Build the app image
docker build -t task2-image .

# Create network bridge for comuunication between the containers
docker network create --subnet=172.18.0.0/16 task2-network

# Run the redis and the app container, exposing the relevant ports and attach them to the new network bridge
docker run -d -p 127.0.0.1:6379:6379 --net task2-network --name task2-redis redis:latest
docker run -d -p 5000:5000 --net task2-network --name task2-app task2-image:latest
