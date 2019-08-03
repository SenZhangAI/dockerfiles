#!/usr/bin/env bash

docker run --build-arg "VIM_ENABLE_ALL=yes" -t "sen/centos:latest" .
