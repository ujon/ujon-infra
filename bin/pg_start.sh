#!/bin/bash

docker compose -f docker-compose.yaml -p ujon down
docker compose -f docker-compose.yaml -p ujon up -d