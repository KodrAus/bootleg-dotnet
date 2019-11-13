#!/bin/bash

set -o errexit -o nounset

echo "include /dotnet/dist/etc/nanorc/csharp.nanorc" >> /etc/nanorc
