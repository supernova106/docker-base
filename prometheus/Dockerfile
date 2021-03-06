FROM alpine:3.6
LABEL maintainer="Binh Nguyen" \
    descriptions="Prometheus on alpine"

# The official Prometheus base image has no package manager so rather than
# artisanally hand-rolling curl and the rest of our stack we'll just use
# Alpine so we can use `docker build`.

RUN apk add --update curl bash

RUN export PROM_VERSION=2.3.1 \
    && export prom=prometheus-${PROM_VERSION}.linux-amd64 \
    && curl -Lso /tmp/${prom}.tar.gz https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/${prom}.tar.gz \
    && tar zxf /tmp/${prom}.tar.gz -C /tmp \
    && mkdir /etc/prometheus /usr/share/prometheus \
    && mv /tmp/${prom}/prometheus /bin/prometheus \
    && mv /tmp/${prom}/promtool /bin/promtool \
    && mv /tmp/${prom}/prometheus.yml /etc/prometheus/ \
    && mv /tmp/${prom}/consoles /usr/share/prometheus/consoles \
    && mv /tmp/${prom}/console_libraries /usr/share/prometheus/console_libraries \
    && ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/ \
    && rm /tmp/prometheus-${PROM_VERSION}.linux-amd64.tar.gz

RUN apk -v --update add \
    python \
    py-pip \
    groff \
    less \
    mailcap \
    && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus

ENTRYPOINT [ "/bin/prometheus" ]
CMD [ "--storage.tsdb.path=/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--web.console.libraries=/usr/share/prometheus/console_libraries", "--web.console.templates=/usr/share/prometheus/consoles" ]
