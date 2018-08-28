FROM fluent/fluentd:v1.2-onbuild
LABEL maintainer="Binh Nguyen" \
    descriptions="Fluentd with modules"

ENV FLUENTD_LOG_LEVEL="info"
ENV FLUENTD_TOKEN=""
ENV FLUENTD_LOGGLY_TAG="docker"

RUN apk add --update --virtual .build-deps \
    sudo build-base ruby-dev \
    && sudo gem install \
    fluent-plugin-elasticsearch \
    fluent-plugin-loggly \
    fluent-plugin-record-reformer \
    fluent-plugin-secure-forward \
    fluent-plugin-kubernetes_metadata_filter \
    && sudo gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    /home/fluent/.gem/ruby/2.3.0/cache/*.gem
