#!/bin/bash

set -o errexit -o nounset

if [ "$CLEAN_SRC" == "1" ]; then
    rm -r /dotnet/src
fi
