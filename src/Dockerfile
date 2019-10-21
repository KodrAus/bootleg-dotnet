FROM ubuntu:18.04

# build and runtime dependencies
RUN apt-get update && apt-get -y install --no-install-recommends \
    git \
    procps \
    lsb-release \
    apt-utils \
    apt-transport-https \
    gpg-agent \
    software-properties-common \
    ca-certificates \
    curl \
    clang-3.9 \
    lldb-3.9 \
    python-lldb-3.9 \
    liblttng-ust-dev \
    libc6-dev \
    libkrb5-dev \
    libicu-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libunwind-dev \
    uuid-dev \
    zlib1g-dev \
    2>&1

RUN curl -L https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
    apt-get update && apt-get -y install --no-install-recommends \
    cmake

RUN rm -rf /var/lib/apt/lists/*

# sources
ARG CORECLR_REF=9db8990bca7e0f44f60494d2608342a930d484ca
ARG COREFX_REF=8d87e5cae96c5fb25ac21442bb56c337029d77a4
ARG CORERT_REF=907e5299e28547e3f581120f49bb44fbde4a3808
ARG CORESETUP_REF=32228f2ae5e68394197859608c8c6afb94276481
ARG CORESDK_REF=ed966bdcc5a68ec63074fb6ee579a5506328c2c7
ARG MSLLVM_REF=acd79ac4ce9b45a92052b8ca19d3e0fd62e4b55f
ARG LLILC_REF=d9e6fd60ad0e22d2355187a304432ca9bcc953d1
ARG DIAGNOSTICS_REF=95e92dbc744e03995a2d2f8b30e457babac312aa

RUN mkdir -p /dotnet/dist/bin && mkdir -p /dotnet/dist/packages

RUN mkdir -p /dotnet/src/coreclr && cd /dotnet/src/coreclr; \
    git clone https://github.com/dotnet/coreclr.git .; \
    git checkout $CORECLR_REF; \
    rm -r .git

RUN mkdir -p /dotnet/src/llvm && cd /dotnet/src/llvm; \
    git clone -b MS https://github.com/microsoft/llvm .; \
    git checkout $MSLLVM_REF; \
    rm -r .git; \
    mkdir build && mkdir -p tools/llilc && cd tools/llilc; \
    git clone https://github.com/dotnet/llilc .; \
    git checkout $LLILC_REF; \
    rm -r .git

RUN mkdir -p /dotnet/src/corert && cd /dotnet/src/corert; \
    git clone https://github.com/dotnet/corert.git .; \
    git checkout $CORERT_REF; \
    rm -r .git

RUN mkdir -p /dotnet/src/corefx && cd /dotnet/src/corefx; \
    git clone https://github.com/dotnet/corefx.git .; \
    git checkout $COREFX_REF; \
    rm -r .git

RUN mkdir -p /dotnet/src/core-setup && cd /dotnet/src/core-setup; \
    git clone https://github.com/dotnet/core-setup.git .; \
    git checkout $CORESETUP_REF; \
    rm -r .git

RUN mkdir -p /dotnet/src/core-sdk && cd /dotnet/src/core-sdk; \
    git clone https://github.com/dotnet/core-sdk.git .; \
    git checkout $CORESDK_REF; \
    rm -r .git

RUN mkdir -p /dotnet/src/diagnostics && cd /dotnet/src/diagnostics; \
    git clone https://github.com/dotnet/diagnostics.git .; \
    git checkout $DIAGNOSTICS_REF; \
    rm -r .git

# builds
RUN cd /dotnet/src/coreclr && ./build.sh -x64 -checked

RUN cd /dotnet/src/llvm/build && \
    cmake \
        -DCMAKE_C_COMPILER=clang-3.9 \
        -DCMAKE_CXX_COMPILER=clang++-3.9 \
        -DWITH_CORECLR=/dotnet/src/coreclr/bin/Product/Linux.x64.Checked \
        -DLLVM_OPTIMIZED_TABLEGEN=ON .. && \
    make

RUN cd /dotnet/src/corert && ./build.sh x64 skiptests; \
    ./buildscripts/build-packages.sh x64

RUN cd /dotnet/src/corefx && ./build.sh --arch x64 --warnAsError false

RUN cd /dotnet/src/core-setup && ./build.sh \
    --restore --build --pack \
    /p:CoreCLROverridePath=/dotnet/src/coreclr/bin/Product/Linux.x64.Checked \
    /p:CoreFXOverridePath=/dotnet/src/corefx/artifacts/packages/Debug

RUN cd /dotnet/src/core-sdk && ./build.sh --architecture x64

RUN cd /dotnet/src/diagnostics && ./build.sh --architecture x64

# distribution
RUN cp -r /dotnet/src/core-sdk/artifacts/bin/redist/Debug/dotnet/* /dotnet/dist/bin && \
    cp -r /dotnet/src/core-setup/artifacts/obj/linux-x64.Debug/sharedFrameworkPublish/* /dotnet/dist/bin
ENV PATH="/dotnet/dist/bin:${PATH}"

RUN cp -r /dotnet/src/core-setup/artifacts/packages/Debug/Shipping/* /dotnet/dist/packages
RUN cp -r /dotnet/src/corert/bin/packages/Debug/* /dotnet/dist/packages
COPY NuGet.Config /root/.nuget/NuGet/NuGet.Config
