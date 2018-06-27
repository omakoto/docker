# Reference: https://docs.docker.com/engine/reference/builder/

ARG gover=1.10

FROM debian:latest
# FROM golang:$gover

ARG user=omakoto
ARG group=user
ARG home=/home/$user
ARG shell=/bin/bash

RUN apt-get update

# bootstrap commands
RUN apt-get install -y git-core gnupg ssh xclip perl curl wget meld ruby python gcc clang autoconf \
        make vim vim-gtk automake libpcre2-dev libpcre3-dev pkg-config acpi \
        zsh less psmisc procps openssh-server coreutils sudo

WORKDIR $home
ENV HOME=$home

RUN groupadd -g 1000 $group && \
    useradd -r -u 1000 -g $group -G sudo -s $shell $user

RUN echo "$user:docker" | chpasswd

RUN chown $user:$group $home

USER $user

ENV GOPATH=$home/go/
RUN mkdir $GOPATH
ENV PATH=$GOPATH/bin:$PATH

ENV SHELL=$shell

RUN echo "PATH=$PATH" >> .profile ;\
    echo "if [ -n \"\$BASH_VERSION\" -a -f .bashrc ] ; then source .bashrc ; fi" >> .profile ;\
    echo "if [ -n \"\$ZSH_VERSION\" -a -f .zshrc ] ; then source .zshrc ; fi" >> .profile

# ENTRYPOINT $SHELL -l
