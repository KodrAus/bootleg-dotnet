#!/bin/bash

set -o errexit -o nounset

mkdir -p /dotnet/dist/etc/nanorc
cp /dotnet/src/etc/nanorc/csharp.nanorc /dotnet/dist/etc/nanorc

echo "include /dotnet/dist/etc/nanorc/csharp.nanorc" >> /etc/nanorc
