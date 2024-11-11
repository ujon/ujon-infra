#!/bin/bash


docker run \
--rm \
--network="host" \
-v ./db/migration:/flyway/sql \
-v ./config/flyway.conf:/flyway/conf/flyway.conf \
flyway/flyway:10.21.0 migrate