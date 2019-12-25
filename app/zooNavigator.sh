#!/usr/bin/env bash

docker run \
    -d --network host \
    -e HTTP_PORT=9000 \
    --name zoonavigator \
    --restart unless-stopped \
    elkozmon/zoonavigator:latest

echo "http://localhost:9000"
