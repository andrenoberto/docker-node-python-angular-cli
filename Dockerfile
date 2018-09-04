FROM ubuntu:xenial

MAINTAINER Andre Noberto <andreno.souza@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm \
    NODEJS_VERSION=10.9.0 \
    PATH=$PATH:/opt/node/bin

WORKDIR "/opt/node"

RUN apt-get -qq update && apt-get -qq install -y curl ca-certificates --no-install-recommends && \
    apt-get install -y gcc g++ make git && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    apt-get install -y python python-dev python-pip python-virtualenv && \
    rm -rf /var/lib/apt/lists/* && \
    npm i -g npm && npm i -g @angular/cli && npm install -g node-gyp