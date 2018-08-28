FROM prom/node-exporter:v0.15.2

ENV NODE_ID=none

USER root

COPY entrypoint.sh /etc/node-exporter/

ENTRYPOINT  [ "/etc/node-exporter/entrypoint.sh" ]
CMD [ "/bin/node_exporter" ]