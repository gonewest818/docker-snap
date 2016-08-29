#!/bin/bash -x

SNAP=0.15.0-beta
SNAP_VER=v${SNAP}

docker run -it --rm -p 8181:8181 gonewest818/intelsdi-snap:${SNAP} -t 0 -l 3
