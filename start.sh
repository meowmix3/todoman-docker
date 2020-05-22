#!/bin/bash
docker stop todoman
docker rm todoman
mkdir {config,data}
docker build -t todoman . && \
docker run -d \
  --name=todoman \
  -u 1000:1000 \
  -e TZ=America/New_York \
  -v "$(pwd)"/config:/.config \
  -v "$(pwd)"/data:/.data \
  --restart=always \
  todoman:latest
docker exec -it todoman vdirsyncer discover
docker exec todoman vdirsyncer sync
docker exec todoman vdirsyncer metasync
