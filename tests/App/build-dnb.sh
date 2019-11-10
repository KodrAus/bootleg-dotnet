#!/bin/bash

set -o errexit -o nounset

dnb
dnb run --build
dnb run --build=r2r

dnb build --kind=aot
./Dnb
