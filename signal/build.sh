#! /bin/bash
set -exu

docker build -t docker-signal .
docker volume ls | awk 'BEGIN{E=1} $2 == "docker-signal"{E=0} END {exit($E)}' || \
docker volume create docker-signal
docker run --rm --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v docker-signal:/home/brave-user:rw --name my-signal docker-signal
