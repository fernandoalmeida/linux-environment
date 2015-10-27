FROM debian:jessie
MAINTAINER Fernando Almeida

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN find /etc/apt/sources.list* -type f -exec sed -i 'p; s/^deb /deb-src /' '{}' +

RUN apt-get update -qq
RUN apt-get install -qqy make sudo

ENV RUNTIME_USER fernando
RUN useradd -m -U -s /bin/bash -G sudo $RUNTIME_USER
RUN echo "$RUNTIME_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $RUNTIME_USER

COPY . /scripts
WORKDIR /scripts

RUN sudo make bash
RUN sudo make git
RUN sudo make ruby
RUN sudo make emacs
RUN sudo make postgresql
RUN sudo make utils
RUN sudo make mongodb
RUN sudo make rabbitmq
RUN sudo make docker
RUN sudo make lua
