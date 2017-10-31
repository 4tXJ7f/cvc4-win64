#!/bin/bash

DEP_PATH=/home/deps/CVC4-deps-shared
wget https://github.com/CVC4/CVC4/archive/master.zip
unzip master.zip
cd CVC4-master
./autogen.sh
./configure production \
  --enable-static-binary \
  --enable-shared \
  --disable-static \
  --enable-proof \
  --host=x86_64-w64-mingw32 \
  LDFLAGS="-L${DEP_PATH}/gmp-5.1.0/lib -L${DEP_PATH}/antlr-3.4/lib -L${DEP_PATH}/boost-1.55.0/lib" \
  CPPFLAGS="-I${DEP_PATH}/gmp-5.1.0/include -I${DEP_PATH}/antlr-3.4/include -I${DEP_PATH}/boost-1.55.0/include -I/usr/lib/jvm/default-java/include/ -I/usr/lib/jvm/default-java/include/linux/" \
  CXXFLAGS="-static-libgcc -static-libstdc++" \
  --with-antlr-dir=${DEP_PATH}/antlr-3.4 ANTLR=${DEP_PATH}/antlr-3.4/bin/antlr3 \
  --enable-language-bindings=java
make -j$(nproc)
cp builds/bin/cvc4.exe /home/dest/
cp builds/src/.libs/libcvc4-4.dll /home/dest/
cp builds/src/parser/.libs/libcvc4parser-4.dll /home/dest/
cp builds/src/bindings/java/.libs/libcvc4jni-4.dll /home/dest/cvc4jni.dll
cp builds/src/bindings/CVC4.jar /home/dest/
cp ${DEP_PATH}/antlr-3.4/bin/libantlr3c.dll /home/dest/
cp ${DEP_PATH}/gmp-5.1.0/bin/{libgmp-10,libgmpxx-4}.dll /home/dest/
cp /usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll /home/dest
cp /usr/lib/gcc/x86_64-w64-mingw32/5.3-posix/libgcc_s_seh-1.dll /home/dest
cp /usr/lib/gcc/x86_64-w64-mingw32/5.3-posix/libstdc++-6.dll /home/dest
