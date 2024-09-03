FROM i386/ubuntu:18.04

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home/psi
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget make nano
#g++-arm-linux-gnueabihf

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 

ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y \
    iputils-ping \
    python3 python3-pip \
    iptables net-tools iproute2 tcpdump
#    tmux htop 

# Copy app to container
COPY . /app
WORKDIR /app

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["bash"]