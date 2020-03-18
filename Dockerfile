FROM ubuntu:bionic

LABEL maintainer="Licsber <Licsber@njit.edu.cn>"

WORKDIR /root

ADD sources.tar.gz /etc/apt/

RUN apt update -y && \
    apt install git -y

RUN apt install build-essential cmake -y && \
    git clone https://github.com/opencv/opencv.git && \
    cd opencv && mkdir build && cd build && \
    CFLAGS="-pipe -O3 -march=core-avx-i" cmake .. && \
    cat /proc/cpuinfo | grep "processor" | wc -l | xargs make -j && \
    make install && cd ../.. && \
    rm -rf opencv
