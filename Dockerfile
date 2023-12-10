FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        sudo \
        apt-utils \
	hugo \
	libmagickwand-dev \
	build-essential \
	libsdl2-dev \
	libsdl2-ttf-dev \
	libpango1.0-dev \
     	libgl1-mesa-dev \
	libopenal-dev \
	libsndfile-dev \
	libmpg123-dev \
        libgmp-dev \
	libcurl4 \
	rubygems \
	ruby-dev \
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
