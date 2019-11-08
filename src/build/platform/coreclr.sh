#!/bin/bash

set -o errexit -o nounset

cd /dotnet/src/platform/coreclr && ./build.sh -x64

cp -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug/.nuget/pkg/* /dotnet/src/packages
cp -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug/.nuget/symbolpkg/* /dotnet/src/packages/symbols
rm -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug/.nuget

cp -r /dotnet/src/platform/coreclr/bin/Product/Linux.x64.Debug /dotnet/dist/clr
