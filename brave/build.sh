#! /bin/bash
set -exu

docker build -t docker-brave .
docker volume ls | awk 'BEGIN{E=1} $2 == "docker-brave"{E=0} END {exit($E)}' || \
docker volume create docker-brave
docker run --rm --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v docker-brave:/home/docker-user:rw --name my-brave docker-brave
