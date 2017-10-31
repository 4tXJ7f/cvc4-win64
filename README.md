# cvc4-win64

This repository contains Dockerfiles for building the Windows version of CVC4
using MinGW-w64. The only prerequisite for building CVC4 for Windows is
[Docker](https://www.docker.com). The instructions have been tested on Windows
(command shell) and Ubuntu (bash). 

## Setup

1. Clone this repository or download archive of the current content.
2. Build the docker file in the `ubuntu16.04-mingw-dev` subdirectory: `$ docker
   build -t ubuntu16.04-mingw-dev ubuntu16.04-mingw-dev`. This builds a docker
   image with all the necessary tools and dependencies for building the Windows
   build.
3. The Dockerfiles in `ubuntu16.04-win64-{static,shared}-build` create images
   for building CVC4 as a static binary or with shared libraries and the Java API
   respectively. Build the docker file in the `ubuntu16.04-win64-static-build` or
   `ubuntu16.04-win64-shared-build` subdirectory: `$ docker build -t
   ubuntu16.04-win64-static-build ubuntu16.04-win64-static-build` or `$ docker
   build -t ubuntu16.04-win64-shared-build ubuntu16.04-win64-shared-build`. This
   builds a docker image with the build script.

## Compiling

To compile a new version of CVC4 execute:

### Bash

Static binary:
```
$ docker run --rm -v `pwd`:/home/dest/:z -t ubuntu16.04-win64-static-build bash build.sh
```

Shared libraries and Java API:
```
$ docker run --rm -v `pwd`:/home/dest/:z -t ubuntu16.04-win64-shared-build bash build.sh
```

### Windows command shell

Static binary:
```
> docker run --rm -v %cd%:/home/dest/:z -t ubuntu16.04-win64-static-build bash build.sh
```

Shared libraries and Java API:
```
> docker run --rm -v %cd%:/home/dest/:z -t ubuntu16.04-win64-shared-build bash build.sh
```

This downloads the current master, builds it, and copies the resulting
executable, DLL files and `CVC4.jar` into the current working directory.

## Using the Java API on Windows

To use the Java API, the JDK needs to be installed. The following instructions
assume that the directory containing `java` and `javac` has been added to
`PATH`.

1. Build the shared version of CVC4.
2. Create a directory for your Java project, copy all DLL files and `CVC4.jar`
   to the project directory. Write some Java code using the CVC4 API for example
   [SimpleVC](https://github.com/CVC4/CVC4/blob/master/examples/SimpleVC.java).
3. Compile the project: `> javac -classpath CVC4.jar SimpleVC.java`
4. Run the project:
   ```
   > java -classpath "CVC4.jar;." SimpleVC
   Checking validity of formula ((x > 0) AND (y > 0)) => (((2 * x) + y) >= 3) with CVC4.
   CVC4 should report VALID.
   Result from CVC4 is: valid
   ```
