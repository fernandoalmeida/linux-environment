FROM debian:7
MAINTAINER Fernando Almeida

RUN apt-get update -qq
RUN apt-get install -qq --yes --force-yes make sudo apt-utils

ENV RUNTIME_USER fernando
RUN useradd -G sudo $RUNTIME_USER
RUN echo "$RUNTIME_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $RUNTIME_USER

COPY . /scripts
WORKDIR /scripts

RUN sudo make git
RUN sudo make ruby
RUN sudo make emacs
