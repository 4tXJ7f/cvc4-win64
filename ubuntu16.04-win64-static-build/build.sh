#!/bin/bash

DEP_PATH=/home/deps/CVC4-deps-static
wget https://github.com/CVC4/CVC4/archive/master.zip
unzip master.zip
cd CVC4-master
./autogen.sh
./configure production \
  --enable-static-binary \
  --enable-proof \
  --disable-shared \
  --host=x86_64-w64-mingw32 \
  LDFLAGS="-L${DEP_PATH}/gmp-5.1.0/lib -L${DEP_PATH}/antlr-3.4/lib -L${DEP_PATH}/boost-1.55.0/lib" \
  CPPFLAGS="-I${DEP_PATH}/gmp-5.1.0/include -I${DEP_PATH}/antlr-3.4/include -I${DEP_PATH}/boost-1.55.0/include" \
  --with-antlr-dir=${DEP_PATH}/antlr-3.4 ANTLR=${DEP_PATH}/antlr-3.4/bin/antlr3
make -j$(nproc)
cp builds/bin/cvc4.exe /home/dest/
