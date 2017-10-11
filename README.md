# cvc4-win64

This repository contains Dockerfiles for building the Windows version of CVC4
using MinGW-w64.

## Setup

1. Clone this repository
2. Build the docker file in the `ubuntu16.04-mingw-dev` subdirectory: `docker
   build -t ubuntu16.04-mingw-dev ubuntu16.04-mingw-dev/`. This builds a docker
   image with all the necessary tools and dependencies for building the Windows
   build.
3. Build the docker file in the `ubuntu16.04-win64` subdirectory: `docker build
   -t ubuntu16.04-win64-build ubuntu16.04-win64-build`. This builds a docker
   image with the build script.

## Compiling

To compile a new version of CVC4 execute:

```
docker run --rm -v `pwd`:/home/dest/:z -t ubuntu16.04-win64-build sh build.sh
```

This downloads the current master, builds it, and copies the resulting
executable into the current working directory.
