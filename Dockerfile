FROM nvidia/cuda:10.1-devel-ubuntu18.04

RUN echo "deb http://archive.ubuntu.com/ubuntu/ focal restricted main multiverse universe" \
      >> /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y \
      libstdc++-10-dev \
      wget \
      xz-utils \
      git \
      python3 \
      cmake \
      qt5-default \
      libboost-all-dev
WORKDIR /root/
RUN mkdir temp && cd temp && \
      wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0-rc2/clang+llvm-10.0.0-rc2-x86_64-linux-gnu-ubuntu-18.04.tar.xz && \
      tar xf clang* && cp -R clang*/* /usr/local/
RUN rm -rf  temp 
