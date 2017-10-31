FROM ubuntu:16.04
WORKDIR /home/deps
RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  build-essential \
  cmake \
  default-jdk \
  default-jre \
  libtool \
  mingw-w64 \
  mingw-w64-tools \
  parallel \
  pkg-config \
  python \
  swig2.0 \
  wget \
  zip
RUN wget https://github.com/4tXJ7f/CVC4/archive/win_deps_tmp.zip
RUN unzip win_deps_tmp.zip && rm win_deps_tmp.zip && mv CVC4-win_deps_tmp CVC4-deps-static && cp -r CVC4-deps-static CVC4-deps-shared
RUN cd CVC4-deps-static && HOST=x86_64-w64-mingw32 contrib/get-win-dependencies
RUN cd CVC4-deps-shared && HOST=x86_64-w64-mingw32 contrib/get-win-dependencies -s
