#!/bin/bash

set -o errexit -o nounset

cp $RT_DIR/Test.CoreLib/Test.CoreLib.dll .

csc Program.cs -out:AOT.CPP.dll \
    -noconfig \
    -nostdlib \
    -r:Test.CoreLib.dll

ilc AOT.CPP.dll -o:AOT.CPP.cpp \
    -r:Test.CoreLib.dll \
    --cpp \
    --disablereflection \
    --systemmodule Test.CoreLib

indent AOT.CPP.cpp
