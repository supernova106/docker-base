FROM alpine:3.7
LABEL maintainer="Binh Nguyen" \
    descriptions="Alpine image with custom libs for troubleshooting, operations"

RUN apk add --update curl bash

WORKDIR  /tmp

ENTRYPOINT [ "/usr/bin/curl" ]
