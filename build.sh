#!/bin/bash -x

SNAP=0.15.0-beta
SNAP_VER=v${SNAP}
SNAP_TAR_DIR=snap-${SNAP}

docker build -f Dockerfile.compile -t snap-compile .
docker run -it --rm -v `pwd`:/mnt -e SNAP_VER=${SNAP_VER} -e SNAP_TAR_DIR=${SNAP_TAR_DIR} snap-compile /mnt/compile.sh
docker build -f Dockerfile.build -t gonewest818/intelsdi-snap:${SNAP} --build-arg SNAP_VER=${SNAP_VER} .
