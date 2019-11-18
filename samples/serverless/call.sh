#!/bin/bash

set -o errexit -o nounset

if [[ -z "${1:-}" ]] || [[ -z "${2:-}" ]]; then
    echo "usage: $0 [jit|r2r|aot] [api/weather]"
    exit 0
fi

kind=$1
path=$2

curl -i -H "X-KIND:$kind" http://localhost:5000/$path
