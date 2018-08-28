FROM jenkins/jenkins:2.113

LABEL maintainer="Binh Nguyen" \
    descriptions="Docker with Jenkins"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
