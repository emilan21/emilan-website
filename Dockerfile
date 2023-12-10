FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        sudo \
        apt-utils \
	hugo \
	ruby \
        git \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose -O /usr/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64 \
    && chmod +x /usr/bin/hadolint

RUN FILENAME="node-v16.16.0-linux-x64.tar.xz" \
    && wget --no-verbose -O "/opt/$FILENAME" "https://nodejs.org/dist/v16.16.0/$FILENAME" \
    && tar -C /usr/local --strip-components 1 -xJf "/opt/$FILENAME" \
    && rm "/opt/$FILENAME"

RUN npm install --location=global npm
RUN npm install --location=global percy

RUN gem install html-proofer

RUN htmlproofer --extension .html ./public

RUN npx percy snapshot ./public

CMD ["/bin/bash"]
