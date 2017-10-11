FROM ubuntu:16.04
WORKDIR /home/deps
RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  build-essential \
  cmake \
  default-jre \
  libboost-dev \
  libcln-dev \
  libgmp-dev \
  libtool \
  mingw-w64 \
  parallel \
  pkg-config \
  wget \
  zip
RUN wget https://github.com/CVC4/CVC4/archive/master.zip
RUN unzip master.zip && rm master.zip
RUN cd CVC4-master && HOST=x86_64-w64-mingw32 contrib/win-build
