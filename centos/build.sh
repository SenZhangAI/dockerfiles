#!/usr/bin/env bash

docker build --build-arg "VIM_ENABLE_ALL=yes" -t "sen/centos:latest" .
