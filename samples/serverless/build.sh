#!/bin/bash

set -o errexit -o nounset

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rid="linux-x64"

if [[ "$(uname)" == "Darwin" ]]; then
    rid="osx-x64"
fi

if [ -d "$SCRIPT_ROOT/App/out/coreclr-jit" ]; then rm -r $SCRIPT_ROOT/App/out/coreclr-jit; fi
dotnet publish $SCRIPT_ROOT/App/App.csproj -c Release -o $SCRIPT_ROOT/App/out/coreclr-jit

if [ -d "$SCRIPT_ROOT/App/out/coreclr-r2r" ]; then rm -r $SCRIPT_ROOT/App/out/coreclr-r2r; fi
dotnet publish $SCRIPT_ROOT/App/App.csproj /p:ReadyToRun=true -r $rid -c Release -o $SCRIPT_ROOT/App/out/coreclr-r2r

if [ -d "$SCRIPT_ROOT/App/out/corert-aot" ]; then rm -r $SCRIPT_ROOT/App/out/corert-aot; fi
dotnet publish $SCRIPT_ROOT/App/App.csproj /p:AOT=true -r $rid -c Release -o $SCRIPT_ROOT/App/out/corert-aot

dotnet publish $SCRIPT_ROOT/Host/Host.csproj -c Release -r $rid
