#!/bin/bash

docker run \
--rm \
--network="host" \
-v ./db/sql:/flyway/sql \
-v ./config/flyway.prod.conf:/flyway/conf/flyway.conf \
flyway/flyway migrate