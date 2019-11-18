#!/bin/bash

set -o errexit -o nounset

getfx System.Console.dll
getfx System.Runtime.dll

csc Program.cs -out:AOT.Linkage.dll \
    -r:$CLR_DIR/System.Private.CoreLib.dll \
    -r:System.Runtime.dll \
    -r:System.Console.dll
