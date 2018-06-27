# Reference: https://docs.docker.com/engine/reference/builder/

ARG gover=1.10

FROM debian:latest
# FROM golang:$gover

ARG user=omakoto
ARG group=user
ARG home=/home/$user
ARG shell=/bin/bash

RUN apt-get update
RUN apt-get install -y git-core zsh vim less psmisc sudo procps curl wget openssh-server coreutils

WORKDIR $home
ENV HOME=$home

RUN groupadd -g 1000 $group && \
    useradd -r -u 1000 -g $group -s $shell $user

RUN chown $user:$group $home

USER $user

ENV GOPATH=$home/go/
RUN mkdir $GOPATH
ENV PATH=$GOPATH/bin:$PATH

ENV SHELL=$shell

RUN echo "PATH=$PATH" >> .profile ;\
    echo "if [ -n \"\$BASH_VERSION\" -a -f .bashrc ] ; then source .bashrc ; fi" >> .profile ;\
    echo "if [ -n \"\$ZSH_VERSION\" -a -f .zshrc ] ; then source .zshrc ; fi" >> .profile

ENTRYPOINT $SHELL -l
