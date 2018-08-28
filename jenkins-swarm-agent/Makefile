#!make
include .env
export $(shell sed 's/=.*//' .env)

help:
	@echo "build - build Jenkins Swarm Agent Docker image"
	@echo "push - push built image to private docker registry"
build:
	sudo docker build -t $(DOCKER_REGISTRY_URL)/jenkins-swarm-agent:$(DOCKER_VERSION)_$(SWARM_CLIENT_VERSION) .
push:
	sudo docker push $(DOCKER_REGISTRY_URL)/jenkins-swarm-agent:$(DOCKER_VERSION)_$(SWARM_CLIENT_VERSION) 
