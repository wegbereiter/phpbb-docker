#!/usr/bin/env bash

docker build -t wegbereiter/phpbb:latest . && docker push wegbereiter/phpbb:latest
