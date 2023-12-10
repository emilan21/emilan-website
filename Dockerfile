FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        sudo \
        apt-utils \
	hugo \
	ruby \
	rubygems \
        git \
        wget \
	nodejs\
	npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --location=global npm
RUN npm install --location=global percy

RUN gem install html-proofer -v 3.4.0

RUN htmlproofer --extension .html ./public

RUN npx percy snapshot ./public

CMD ["/bin/bash"]
