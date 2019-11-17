#!/bin/bash

set -o errexit -o nounset

cp $RT_DIR/Test.CoreLib/Test.CoreLib.dll .

csc Program.cs -out:AOT.Test.CoreLib.dll \
    -noconfig \
    -nostdlib \
    -r:Test.CoreLib.dll

ilc AOT.Test.CoreLib.dll -o:AOT.Test.CoreLib.o \
    -r:Test.CoreLib.dll \
    --Os \
    --disablereflection \
    --systemmodule Test.CoreLib

clang-3.9 AOT.Test.CoreLib.o -o AOT.Test.CoreLib \
    $RT_DIR/sdk/libbootstrapper.a \
    $RT_DIR/sdk/libRuntime.a \
    -Os \
    -Wl,--as-needed \
    -pthread \
    -lstdc++ \
    -ldl \
    -lm \
    -lz \
    -lgssapi_krb5 \
    -lrt

strip AOT.Test.CoreLib --strip-all
