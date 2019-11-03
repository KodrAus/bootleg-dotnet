#!/bin/bash

set -o errexit -o nounset

# src: platform: coreclr
mkdir -p /dotnet/src/platform/coreclr && cd /dotnet/src/platform/coreclr
git clone https://github.com/dotnet/coreclr.git .
git checkout $CORECLR_REF

# src: platform: corefx
mkdir -p /dotnet/src/platform/corefx && cd /dotnet/src/platform/corefx
git clone https://github.com/dotnet/corefx.git .
git checkout $COREFX_REF

# src: platform: corert
mkdir -p /dotnet/src/platform/corert && cd /dotnet/src/platform/corert
git clone https://github.com/dotnet/corert.git .
git checkout $CORERT_REF
git apply --ignore-space-change --ignore-whitespace /dotnet/src/patch/corert/corert.patch

# src: platform: llvm
mkdir -p /dotnet/src/platform/llvm-project && cd /dotnet/src/platform/llvm-project
git clone --single-branch -b release/5.x https://github.com/llvm/llvm-project .
git checkout $LLVM_REF
git apply --ignore-space-change --ignore-whitespace /dotnet/src/patch/corert/ObjWriter/llvm.patch
cp -r /dotnet/src/platform/corert/src/Native/ObjWriter /dotnet/src/platform/llvm-project/llvm/tools
cp -r /dotnet/src/patch/llilc/CoreDisTools /dotnet/src/platform/llvm-project/llvm/tools

# src: sdk: diagnostics
mkdir -p /dotnet/src/sdk/diagnostics && cd /dotnet/src/sdk/diagnostics
git clone https://github.com/dotnet/diagnostics.git .
git checkout $DIAGNOSTICS_REF

# src: sdk: roslyn
mkdir -p /dotnet/src/sdk/roslyn && cd /dotnet/src/sdk/roslyn
git clone https://github.com/dotnet/roslyn.git .
git checkout $ROSLYN_REF

mkdir -p /dotnet/dist/packages/symbols
mkdir -p /dotnet/dist/tools
