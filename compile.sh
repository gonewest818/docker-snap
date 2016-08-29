#!/bin/bash -x

go get github.com/Masterminds/glide

export SNAPBUILD=$GOPATH/src/github.com/intelsdi-x/snap

# Intel SNAP
go get -d github.com/intelsdi-x/snap
cd $SNAPBUILD 
git checkout $SNAP_VER
make

# Disk metric plugin
go get github.com/intelsdi-x/snap-plugin-collector-disk
go build -o $SNAPBUILD/build/plugin/snap-plugin-collector-disk\
         github.com/intelsdi-x/snap-plugin-collector-disk

# CPU metric plugin
go get github.com/intelsdi-x/snap-plugin-collector-cpu
go build -o $SNAPBUILD/build/plugin/snap-plugin-collector-cpu\
         github.com/intelsdi-x/snap-plugin-collector-cpu

