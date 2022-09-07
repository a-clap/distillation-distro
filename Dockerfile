FROM ubuntu:20.04

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y
RUN apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip \
    python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev  \
    pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool


ARG username=yocto

RUN useradd -ms /bin/bash ${username}

USER ${username}

env HOME=/home/${username}

RUN mkdir -p $HOME/downloads
RUN mkdir -p $HOME/sstate

WORKDIR $HOME

