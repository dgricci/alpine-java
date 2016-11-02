# Java 8 environment
# Cf.  # https://github.com/docker-library/openjdk/blob/54c64cf47d2b705418feb68b811419a223c5a040/8-jdk/alpine/Dockerfile
# from Tianon Gravi
FROM dgricci/alpine:3.4.4
MAINTAINER Didier Richard <didier.richard@ign.fr>

RUN \
    apk update && \
    # add a simple script that can auto-detect the appropriate JAVA_HOME value
    # based on whether the JDK or only the JRE is installed
    { \
        echo '#!/bin/sh'; \
        echo 'set -e'; \
        echo; \
        echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home && \
    chmod +x /usr/local/bin/docker-java-home

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin
ENV JAVA_VERSION 8u92
ENV JAVA_ALPINE_VERSION 8.92.14-r1

RUN \
    apk add --update \
        openjdk8="$JAVA_ALPINE_VERSION" \
    && \
    rm -rf /var/cache/apk/* && \
    set -x && [ "$JAVA_HOME" = "$(docker-java-home)" ]

