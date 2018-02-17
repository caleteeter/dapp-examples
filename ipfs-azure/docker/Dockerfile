FROM golang:1.9-stretch

MAINTAINER Cale Teeter <cale.teeter@microsoft.com>

ENV IPFS_VERSION ""
ENV BOOTNODEIP ""
ENV NODEID ""

COPY config.sh /

RUN chmod +x /config.sh

ENTRYPOINT [ "/bin/sh", "-c", "/config.sh" ] 