#!/bin/bash

docker compose -f docker-compose.local.yaml -p ujon down
docker compose -f docker-compose.local.yaml -p ujon up -d