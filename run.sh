#!/bin/bash

echo '[-]'
echo '[-] Launching the TASTE Docker container...'
echo '[-]'
HOMEB=/root
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch ${XAUTH}
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge -
export TASTE_IN_DOCKER=1
docker run \
    --privileged \
#    --device=/dev/input/js0 \
#    --device=/dev/video0 \
    --name=esrocos \
    -e DISPLAY \
    -e TASTE_IN_DOCKER \
    -e XAUTHORITY=${XAUTH} \
    -v ${XSOCK}:${XSOCK}:rw \
    -v ${XAUTH}:${XAUTH} \
    -v "$HOME":"$HOMEB"/work \
    -w "/root/" \
    -h "taste" \
    -it $1 /bin/bash -i
