#!/bin/bash

set -o errexit -o nounset

ilc AOT.Linkage.dll -o:AOT.Linkage.o \
    -r:$RT_DIR/sdk/System.Private.CoreLib.dll \
    -r:System.Runtime.dll \
    -r:System.Console.dll \
    --initassembly:System.Private.CoreLib \
    --disablereflection \
    --removefeature:CurlHandler
