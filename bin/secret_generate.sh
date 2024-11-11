#!/bin/bash

# Generate a secret key for GitHub Actions to access the production database.
base64 -i ./config/flyway.conf -o ./config/flyway.conf.b64