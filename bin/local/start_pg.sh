#!/bin/bash

docker compose -f docker-compose.local.yaml -p ujon-local down
docker compose -f docker-compose.local.yaml -p ujon-local up -d