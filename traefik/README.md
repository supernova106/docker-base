# Reverse Proxy - Traefik

```shell
sudo docker network create --driver=overlay traefik-net
```

```shell
sudo docker service create \
    --name traefik \
    --constraint=node.role==manager \
    --replicas 3 \
    --publish 80:80 \
    --publish 8081:8080 \
    --publish 443:443 \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
    --network traefik-net \
    traefik \
    --docker \
    --docker.swarmmode \
    --docker.domain=swarm.example.com \
    --docker.watch \
    --api \
    --entrypoints='Name:https Address::443 TLS' \
    --defaultentrypoints=http,https
```

Test docker image

```shell
sudo docker service create \
    --name whoami0 \
    --label traefik.port=80 \
    --label traefik.enable=true \
    --network traefik-net \
    emilevauge/whoami
```

Test overlay network

```shell
sudo docker service create \
--name nginx \
--label traefik.port=80 \
--network traefik-net \
nginx
```

`apt update && apt install -y netcat`

If using `traefik.toml`

```yaml
accessLogsFile = "/dev/stdout"
defaultEntryPoints = ["http", "https"]
[entryPoints]
  [entryPoints.http]
  address = ":80"
  [entryPoints.https]
  address = ":443"
    [entryPoints.https.tls]
      [[entryPoints.https.tls.certificates]]
      CertFile = "/run/secrets/cert.pem"
      KeyFile = "/run/secrets/key.pem"
[web]
address = ":8081"
[docker]
endpoint = "unix:///var/run/docker.sock"
domain = "swarm.example.com"
watch = true
swarmmode = true
exposedbydefault = false
```

Setup TLS

```shell
sudo docker secret create cert.pem swarm.example.com.crt
sudo docker secret create key.pem swarm.example.com.key
sudo docker config create traefik.toml traefik.toml
```

Deploy Traefik with TLS and `traefik.toml`

```shell
sudo docker service create \
    --name traefik \
    --constraint=node.role==manager \
    --replicas 3 \
    --publish 80:80 \
    --publish 8081:8080 \
    --publish 443:443 \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
    --secret source=cert.pem,target=cert.pem \
    --secret source=key.pem,target=key.pem \
    --config source=traefik.toml,target="/etc/traefik/traefik.toml" \
    --network traefik-net \
    traefik \
    --api 
```

## Contact

Bean Nguyen
