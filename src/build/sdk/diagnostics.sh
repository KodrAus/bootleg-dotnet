#!/bin/bash

set -o errexit -o nounset

cd /dotnet/src/sdk/diagnostics && ./build.sh --architecture x64
