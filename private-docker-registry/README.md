# Private Docker Registry

```
sudo docker service create \
    --name registry \
    --label traefik.port=5000 \
    --label traefik.enable=true \
    --network traefik-net \
    --constraint 'node.role == manager' \
    --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
    --mount type=volume,volume-driver=cloudstor:aws,source={{.Service.Name}}-{{.Task.Slot}}-vol,destination=/var/lib/registry,volume-opt=backing=relocatable,volume-opt=size=20,volume-opt=ebstype=gp2 \
    registry:2
```

Traefik will handle TLS at the reverse proxy level

```
# Setup self-signed certs as exactly below folder structure with registry.swarm.nonprod.example.local is the Registry domain
root@qa1-swarm01:/etc/docker/certs.d# pwd
/etc/docker/certs.d
root@qa1-swarm01:/etc/docker/certs.d# ls -la registry.swarm.nonprod.example.local/
total 24
-rw-r--r-- 1 root root  484 Mar 25 06:50 ~
drwxr-xr-x 2 root root 4096 Mar 25 06:51 .
drwxr-xr-x 4 root root 4096 Mar 25 06:50 ..
-rw-r--r-- 1 root root 1769 Mar 25 06:50 swarm.nonprod.example.local.cert
-rw-r--r-- 1 root root 1387 Mar 25 06:50 swarm.nonprod.example.local.crt
-rw-r--r-- 1 root root 1704 Mar 25 06:50 swarm.nonprod.example.local.key
```
