#!/usr/bin/env bash

docker run -d -p 8081:8081 --name nexus sonatype/nexus3
docker run -d -v /var/docker/zookeeper:/data -v /var/docker/zookeeperhost/zookeeperDataLogDir:/datalog  -e ZOO_MY_ID=1 -e ZOO_SERVERS='server.1=125.77.116.145:2888:3888'  -p 2182:2181 -p 2888:2888 -p 3888:3888  --name zookeeper --privileged zookeeper
