DOCKER_REGISTRY="registry.nonprod.example.local"
IMAGE_NAME="curl"
VERSION=`cat version`
IMAGE_TAG="v$(VERSION)"
build:
	sudo docker build -t $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG) .
push:
	sudo docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
