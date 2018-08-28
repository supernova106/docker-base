#!make
include .env
export $(shell sed 's/=.*//' .env)

help:
	@echo "build - build Jenkins Docker image"
	@echo "build-qa - build QA Jenkins Docker image"
	@echo "push - push Jenkins Docker image"
	@echo "push-qa - push QA Jenkins Docker image"	
build:
	sudo docker build -t $(DOCKER_REGISTRY_URL)/jenkins:$(JENKINS_VERSION) .
build-qa:
	sudo docker build -f Dockerfile.qa -t $(DOCKER_REGISTRY_URL)/jenkins:$(JENKINS_VERSION)-qa .	
push:
	sudo docker push $(DOCKER_REGISTRY_URL)/jenkins:$(JENKINS_VERSION)
push-qa:
	sudo docker push $(DOCKER_REGISTRY_URL)/jenkins:$(JENKINS_VERSION)-qa	

