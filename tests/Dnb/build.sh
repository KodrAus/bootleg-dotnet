#!/bin/bash

set -o errexit -o nounset

dnb run --build
dnb run --build=r2r
dnb build --kind=aot
./Dnb
