FROM ubuntu:18.04

ARG CORECLR_REF=9db8990bca7e0f44f60494d2608342a930d484ca
ARG MSLLVM_REF=acd79ac4ce9b45a92052b8ca19d3e0fd62e4b55f
ARG LLILC_REF=d9e6fd60ad0e22d2355187a304432ca9bcc953d1
ARG COREFX_REF=8d87e5cae96c5fb25ac21442bb56c337029d77a4
ARG CORERT_REF=907e5299e28547e3f581120f49bb44fbde4a3808
ARG DIAGNOSTICS_REF=95e92dbc744e03995a2d2f8b30e457babac312aa
ARG CORESDK_REF=ed966bdcc5a68ec63074fb6ee579a5506328c2c7
ARG CORESETUP_REF=32228f2ae5e68394197859608c8c6afb94276481

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
    2>&1 && \
    curl -L https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
    apt-get update && apt-get -y install --no-install-recommends \
        cmake && \
    rm -rf /var/lib/apt/lists/*

COPY build.sh /dotnet/build.sh
RUN /dotnet/build.sh
ENV PATH="/dotnet/dist/bin:${PATH}"
COPY NuGet.Config /root/.nuget/NuGet/NuGet.Config
