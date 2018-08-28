FROM docker:17.12.1-ce
LABEL maintainer="Binh Nguyen" \
    descriptions="Docker with Jenkins Swarm Agent"

ARG SWARM_CLIENT_VERSION=3.9  
RUN apk --update add openjdk8-jre git \
    && wget -O swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh  \
    && sed -i -e 's/\r$//' /entrypoint.sh

CMD ["/entrypoint.sh"]
