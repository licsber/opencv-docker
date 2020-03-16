FROM ubuntu:bionic

LABEL maintainer="Licsber <Licsber@njit.edu.cn>"

WORKDIR /root

ADD sources.tar.gz /etc/apt/

RUN apt update -y && \
    apt install git -y
