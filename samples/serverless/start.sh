#!/bin/bash

set -o errexit -o nounset

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rid="linux-x64"

if [[ "$(uname)" == "Darwin" ]]; then
    rid="osx-x64"
fi

pushd $SCRIPT_ROOT

./Host/bin/Release/netcoreapp3.0/$rid/publish/Host
