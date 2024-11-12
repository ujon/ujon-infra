#!/bin/bash

# Generate a secret key for GitHub Actions to access the production database.
echo "FLYWAY_CONFIG:"
cat ./config/flyway.conf | base64
