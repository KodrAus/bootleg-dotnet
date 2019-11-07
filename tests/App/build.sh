#!/bin/bash

set -o errexit -o nounset

# Build our C# app
csc -recurse:**/*.cs -out:App.dll -r:$CLR_CORELIB

# Examine its IL
ildasm -in:App.dll

# Run our compiled app
corerun App.dll

# Pre-JIT our app
crossgen App.dll -out:App.r2r.dll -r:$CLR_CORELIB

# Examine its native code
r2rdump -in:App.r2r.dll -d

# Run our compiled app again
corerun App.r2r.dll

# Ahead-of-time compile our app
ilc App.dll -out:App.o -r:$CLR_CORELIB

# Link it up
clang-3.9 App.o -o App

# Run our app without corerun
./App
