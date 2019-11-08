#!/bin/bash

set -o errexit -o nounset

cd /dotnet/src/sdk/roslyn && ./build.sh \
    --restore \
    --build \
    --pack \
    --publish
