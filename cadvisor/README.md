# Cadvisor Docker

# Deploy

```
sudo docker service create \
    --mode=global \
    --name cadvisor \
    --publish 8082:8080 \
    --restart-condition="on-failure" \
    --restart-max-attempts 3 \
    --limit-memory 128M \
    --reserve-memory 64M \
    --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock:ro \
    --mount type=bind,src=/,dst=/rootfs:ro \
    --mount type=bind,src=/var/run,dst=/var/run \
    --mount type=bind,src=/sys,dst=/sys:ro \
    --mount type=bind,src=/var/lib/docker/,dst=/var/lib/docker:ro \
    --mount type=bind,src=/dev/disk/,dst=/dev/disk:ro \
    google/cadvisor \
    -logtostderr -docker_only
```