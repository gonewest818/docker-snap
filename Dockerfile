FROM alpine:3.4
ARG SNAP_VER=v0.15.0-beta
ENV SNAP_VER ${SNAP_VER}

RUN apk add --no-cache curl bash tar

RUN curl -L -O https://github.com/intelsdi-x/snap/releases/download/${SNAP_VER}/snap-${SNAP_VER}-linux-amd64.tar.gz &&\
    tar xfz snap-${SNAP_VER}-linux-amd64.tar.gz &&\
    rm snap-${SNAP_VER}-linux-amd64.tar.gz &&\
    mv snap-${SNAP_VER} snap

RUN curl -L -O https://github.com/intelsdi-x/snap/releases/download/${SNAP_VER}/snap-plugins-${SNAP_VER}-linux-amd64.tar.gz &&\
    tar xfz snap-plugins-${SNAP_VER}-linux-amd64.tar.gz &&\
    rm snap-plugins-${SNAP_VER}-linux-amd64.tar.gz &&\
    mkdir -p snap/plugin &&\
    mv snap-${SNAP_VER}/plugin/snap-plugin-collector-mock1 \
       snap-${SNAP_VER}/plugin/snap-plugin-collector-mock2 \
       snap-${SNAP_VER}/plugin/snap-plugin-processor-passthru \
       snap-${SNAP_VER}/plugin/snap-plugin-publisher-file \
       snap/plugin &&\
    rm -rf snap-${SNAP_VER}

# because alpine uses musl, we must explicitly launch this way
EXPOSE 8181
#ENV SNAP_AUTODISCOVER_PATH /snap/plugin
ENTRYPOINT ["/lib/ld-musl-x86_64.so.1", "/snap/bin/snapd"]
CMD ["--plugin-trust", "0", "--log-level", "1"]

