FROM ubuntu:14.10
MAINTAINER Fernando Almeida

RUN apt-get update -qq
RUN apt-get install make wget --yes --force-yes

ENV RUNTIME_USER fernando
RUN adduser $RUNTIME_USER && adduser $RUNTIME_USER sudo
RUN echo "$RUNTIME_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $RUNTIME_USER

COPY . /scripts
WORKDIR /scripts

RUN sudo make git
RUN sudo make ruby
RUN sudo make emacs
