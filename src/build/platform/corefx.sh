#!/bin/bash

set -o errexit -o nounset

cd /dotnet/src/platform/corefx && ./build.sh \
    --arch x64 \
    --warnAsError false \
    --restore \
    --build \
    --pack \
    --publish

cp -r /dotnet/src/platform/corefx/artifacts/packages/Debug/Shipping/* /dotnet/dist/packages
cp -r /dotnet/src/platform/corefx/artifacts/packages/Debug/NonShipping/* /dotnet/dist/packages
cp -r /dotnet/src/platform/corefx/artifacts/bin/runtime/netcoreapp-Linux-Debug-x64 /dotnet/dist/fx
