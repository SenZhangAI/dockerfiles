#!/usr/bin/env bash

docker run -di --name zs_mysql -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7
