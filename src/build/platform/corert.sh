#!/bin/bash

set -o errexit -o nounset

export RyuJITVersion="5.0.0-dev*"
export ObjectWriterVersion="1.0.0-dev*"
export CoreFxVersion="5.0.0-dev*"
export MicrosoftNETCoreNativeVersion="5.0.0-dev*"

cd /dotnet/src/platform/corert

./build.sh x64 skiptests
./buildscripts/build-packages.sh x64

cp -r /dotnet/src/platform/corert/bin/packages/Debug/* /dotnet/src/packages

mkdir -p /dotnet/dist/rt
cp -r /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework /dotnet/dist/rt/inc
cp -r /dotnet/src/platform/corert/bin/Linux.x64.Debug/framework /dotnet/dist/rt/framework
cp -r /dotnet/src/platform/corert/bin/Linux.x64.Debug/sdk /dotnet/dist/rt/sdk
