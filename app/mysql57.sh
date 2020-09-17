#!/usr/bin/env bash

docker run -di \
    --name zs_mysql \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=luna123456 \
    mysql:5.7
