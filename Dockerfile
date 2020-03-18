FROM ubuntu:bionic

LABEL maintainer="Licsber <Licsber@njit.edu.cn>"

WORKDIR /root

ADD sources.tar.gz /etc/apt/

RUN apt update -y && \
    apt install git -y

RUN apt install build-essential cmake libgtk2.0-dev pkg-config \
    libavcodec-dev libavformat-dev libswscale-dev -y && \
    git clone https://github.com/opencv/opencv.git && \
    cd opencv && mkdir build && cd build && \
    cmake -D CMAKE_BUILD_TYPE=Release .. && \
    cat /proc/cpuinfo | grep "processor" | wc -l | xargs make -j && \
    make install && cd ../.. && \
    rm -rf opencv
