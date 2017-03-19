#!/bin/bash -x

. snap-version

docker build -f Dockerfile.compile -t snap-compile .
docker run -it --rm -v `pwd`:/mnt -e SNAP_VER=${SNAP_VER} snap-compile /mnt/compile.sh
docker build -f Dockerfile.build -t gonewest818/intelsdi-snap:${SNAP_VER} --build-arg SNAP_VER=${SNAP_VER} .
