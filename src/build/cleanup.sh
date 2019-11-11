#!/bin/bash

set -o errexit -o nounset

if [ "$CLEAN_SRC" == "1" ]; then
    mkdir -p /dotnet/src-tmp/platform

    cp -r /dotnet/src/platform/coreclr /dotnet/src-tmp/platform
    rm -r /dotnet/src-tmp/platform/coreclr/bin
    rm -r /dotnet/src-tmp/platform/coreclr/.git

    cp -r /dotnet/src/platform/corefx /dotnet/src-tmp/platform
    rm -r /dotnet/src-tmp/platform/corefx/artifacts
    rm -r /dotnet/src-tmp/platform/corefx/.git

    cp -r /dotnet/src/platform/corert /dotnet/src-tmp/platform
    rm -r /dotnet/src-tmp/platform/corert/bin
    rm -r /dotnet/src-tmp/platform/corert/.git

    rm -r /dotnet/src
    mv /dotnet/src-tmp /dotnet/src
fi
