#!/usr/bin/env bash

docker run \
    -d -p 8081:8081
    --name nexus
    sonatype/nexus3
