#!/bin/bash -ex

CONTAINER_NAME="jenkins-master"
IMAGE_NAME="jenkins/jenkins"
IMAGE_TAG="2.117"

sudo docker rm -f ${CONTAINER_NAME} > /dev/null
sudo docker run -d \
    --restart=always \
    --net=host \
    --name=${CONTAINER_NAME} \
    -–log-driver syslog \
    -u usc-ci-jenkins \
    -v /var/lib/jenkins:/var/jenkins_home \
    -v /var/docker/docker.sock:/var/docker/docker.sock \
    ${IMAGE_NAME}:${IMAGE_TAG}