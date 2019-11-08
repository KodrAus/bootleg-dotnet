#!/bin/bash

set -o errexit -o nounset

mkdir /dotnet/src/platform/llvm-project/llvm/build && cd /dotnet/src/platform/llvm-project/llvm/build
cmake \
    -DCMAKE_C_COMPILER=clang-3.9 \
    -DCMAKE_CXX_COMPILER=clang++-3.9 \
    -DLLVM_OPTIMIZED_TABLEGEN=ON \
    -DLLVM_INCLUDE_TESTS=0 \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    ..
make

cp /dotnet/src/patch/corert/ObjWriter/Microsoft.DotNet.ObjectWriter.nuspec /dotnet/src/platform/llvm-project/llvm/build/lib
nuget pack /dotnet/src/platform/llvm-project/llvm/build/lib/Microsoft.DotNet.ObjectWriter.nuspec \
    -version 1.0.0-dev \
    -outputdirectory /dotnet/src/packages

cp /dotnet/src/platform/llvm-project/llvm/build/lib/libcoredistools.so /usr/lib
cp /dotnet/src/platform/llvm-project/llvm/build/lib/libobjwriter.so /usr/lib
