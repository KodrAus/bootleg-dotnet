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
git apply --ignore-space-change --ignore-whitespace /dotnet/src/patch/corert/corert.patch

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
git apply --ignore-space-change --ignore-whitespace /dotnet/src/patch/ObjWriter/llvm.patch
cp -r /dotnet/src/corert/src/Native/ObjWriter /dotnet/src/llvm-project/llvm/tools
cp -r /dotnet/src/patch/CoreDisTools /dotnet/src/llvm-project/llvm/tools

mkdir -p /dotnet/dist/bin && mkdir -p /dotnet/dist/packages/symbols

# build: coreclr
cd /dotnet/src/coreclr
./build.sh -x64 -checked
cp -r /dotnet/src/coreclr/bin/Product/Linux.x64.Checked/.nuget/pkg/* /dotnet/dist/packages
cp -r /dotnet/src/coreclr/bin/Product/Linux.x64.Checked/.nuget/symbolpkg/* /dotnet/dist/packages/symbols

# build: corefx
cd /dotnet/src/corefx && ./build.sh --arch x64 --warnAsError false
cp -r /dotnet/src/corefx/artifacts/packages/Debug/Shipping/* /dotnet/dist/packages
cp -r /dotnet/src/corefx/artifacts/packages/Debug/NonShipping/* /dotnet/dist/packages

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
cp /dotnet/src/llvm-project/llvm/build/lib/libcoredistools.so /dotnet/src/coreclr/bin/Product/Linux.x64.Checked
cp /dotnet/src/patch/ObjWriter/Microsoft.DotNet.ObjectWriter.nuspec /dotnet/src/llvm-project/llvm/build/lib
nuget pack /dotnet/src/llvm-project/llvm/build/lib/Microsoft.DotNet.ObjectWriter.nuspec \
    -version 1.0.0-dev \
    -outputdirectory /dotnet/dist/packages

# build: corert
export RyuJITVersion="5.0.0-dev*"
export ObjectWriterVersion="1.0.0-dev*"
export CoreFxVersion="5.0.0-dev*"
export MicrosoftNETCoreNativeVersion="5.0.0-dev*"
cd /dotnet/src/corert
./build.sh x64 skiptests
./buildscripts/build-packages.sh x64
cp -r /dotnet/src/corert/bin/packages/Debug/* /dotnet/dist/packages

# build: diagnostics
cd /dotnet/src/diagnostics && ./build.sh --architecture x64

# build: core-sdk
cd /dotnet/src/core-sdk && ./build.sh --architecture x64
rm -r /dotnet/src/core-sdk/artifacts/bin/redist/Debug/dotnet/shared/Microsoft.NETCore.App
cp -r /dotnet/src/core-sdk/artifacts/bin/redist/Debug/dotnet/* /dotnet/dist/bin

# build: core-setup
cd /dotnet/src/core-setup && ./build.sh \
    --restore --build --pack \
    /p:CoreCLROverridePath=/dotnet/src/coreclr/bin/Product/Linux.x64.Checked \
    /p:CoreFXOverridePath=/dotnet/src/corefx/artifacts/packages/Debug
cp -r /dotnet/src/core-setup/artifacts/obj/linux-x64.Debug/sharedFrameworkPublish/* /dotnet/dist/bin
cp -r /dotnet/src/core-setup/artifacts/packages/Debug/Shipping/* /dotnet/dist/packages

# cleanup
if [ "$CLEAN_SRC" == "1" ]; then
    rm -r /dotnet/src
fi
