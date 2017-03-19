#!/bin/bash -x

. snap-version

docker run -it --rm -p 8181:8181 gonewest818/intelsdi-snap:${SNAP_VER} -t 0 -l 3
