FROM ubuntu:20.04

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip \
    python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev  \
    pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool locales tar tmux vim tig

RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

ARG username=yocto
RUN useradd -ms /bin/bash ${username}

COPY scripts/run.sh /usr/bin/yocto-run.sh
RUN chmod a+x /usr/bin/yocto-run.sh

env HOME=/home/${username}

RUN mkdir -p $HOME/build
RUN mkdir -p $HOME/src
RUN mkdir -p $HOME/downloads
RUN mkdir -p $HOME/sstate

COPY scripts/Makefile /home/${username}/build/Makefile
RUN chmod a+x /home/${username}/build/Makefile

USER ${username}

ENTRYPOINT ["/usr/bin/yocto-run.sh"]
