#!/bin/bash -x

go get github.com/Masterminds/glide
mkdir -p $GOPATH/src/github.com/intelsdi-x
cd $GOPATH/src/github.com/intelsdi-x
curl -L -O https://github.com/intelsdi-x/snap/archive/${SNAP_VER}.tar.gz
tar xfz ${SNAP_VER}.tar.gz
mv ${SNAP_TAR_DIR} snap
cd $GOPATH/src/github.com/intelsdi-x/snap
make
