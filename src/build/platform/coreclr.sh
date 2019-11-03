#!/bin/bash

set -o errexit -o nounset

cd /dotnet/src/platform/coreclr && ./build.sh -x64

cp -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug/.nuget/pkg/* /dotnet/dist/packages
cp -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug/.nuget/symbolpkg/* /dotnet/dist/packages/symbols
cp -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug /dotnet/dist/clr
