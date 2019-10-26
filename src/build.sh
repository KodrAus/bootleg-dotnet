#!/bin/bash

set -o errexit -o nounset

# src: coreclr
mkdir -p /dotnet/src/coreclr && cd /dotnet/src/coreclr
git clone https://github.com/dotnet/coreclr.git .
git checkout $CORECLR_REF

# src: corefx
mkdir -p /dotnet/src/corefx && cd /dotnet/src/corefx
git clone https://github.com/dotnet/corefx.git .
git checkout $COREFX_REF

# src: corert
mkdir -p /dotnet/src/corert && cd /dotnet/src/corert
git clone https://github.com/dotnet/corert.git .
git checkout $CORERT_REF
rm /dotnet/src/corert/src/Native/ObjWriter/llvm.patch
cp /dotnet/src/patch/ObjWriter/llvm.patch /dotnet/src/corert/src/Native/ObjWriter

# src: core-sdk
mkdir -p /dotnet/src/core-sdk && cd /dotnet/src/core-sdk
git clone https://github.com/dotnet/core-sdk.git .
git checkout $CORESDK_REF

# src: core-setup
mkdir -p /dotnet/src/core-setup && cd /dotnet/src/core-setup
git clone https://github.com/dotnet/core-setup.git .
git checkout $CORESETUP_REF

# src: diagnostics
mkdir -p /dotnet/src/diagnostics && cd /dotnet/src/diagnostics
git clone https://github.com/dotnet/diagnostics.git .
git checkout $DIAGNOSTICS_REF

# src: llvm
mkdir -p /dotnet/src/llvm-project && cd /dotnet/src/llvm-project
git clone --single-branch -b release/5.x https://github.com/llvm/llvm-project .
git checkout $LLVM_REF
cp -r /dotnet/src/corert/src/Native/ObjWriter /dotnet/src/llvm-project/llvm/tools
cp -r /dotnet/src/patch/CoreDisTools /dotnet/src/llvm-project/llvm/tools
git apply /dotnet/src/llvm-project/llvm/tools/ObjWriter/llvm.patch

# build: llvm
mkdir /dotnet/src/llvm-project/llvm/build && cd /dotnet/src/llvm-project/llvm/build
cmake \
    -DCMAKE_C_COMPILER=clang-3.9 \
    -DCMAKE_CXX_COMPILER=clang++-3.9 \
    -DLLVM_OPTIMIZED_TABLEGEN=ON \
    -DLLVM_INCLUDE_TESTS=0 \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    ..
make

# build: coreclr
cd /dotnet/src/coreclr && ./build.sh -x64 -checked

# build: corefx
cd /dotnet/src/corefx && ./build.sh --arch x64 --warnAsError false

# build: corert
cd /dotnet/src/corert
./build.sh x64 skiptests
./buildscripts/build-packages.sh x64

# build: diagnostics
cd /dotnet/src/diagnostics && ./build.sh --architecture x64

# build: core-sdk
cd /dotnet/src/core-sdk && ./build.sh --architecture x64

# build: core-setup
cd /dotnet/src/core-setup && ./build.sh \
    --restore --build --pack \
    /p:CoreCLROverridePath=/dotnet/src/coreclr/bin/Product/Linux.x64.Checked \
    /p:CoreFXOverridePath=/dotnet/src/corefx/artifacts/packages/Debug

mkdir -p /dotnet/dist/bin && mkdir -p /dotnet/dist/packages

# dist: sdk
cp -r /dotnet/src/core-sdk/artifacts/bin/redist/Debug/dotnet/* /dotnet/dist/bin

# dist: runtime
cp -r /dotnet/src/core-setup/artifacts/obj/linux-x64.Debug/sharedFrameworkPublish/* /dotnet/dist/bin
cp -r /dotnet/src/core-setup/artifacts/packages/Debug/Shipping/* /dotnet/dist/packages

# dist: corert
cp -r /dotnet/src/corert/bin/packages/Debug/* /dotnet/dist/packages

# cleanup
rm -r /dotnet/src
