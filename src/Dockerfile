FROM ubuntu:18.04

ARG CORECLR_REF=9db8990bca7e0f44f60494d2608342a930d484ca
ARG LLVM_REF=6a075b6de4cafebec9ca1ff9eec7229a617c93f6
ARG COREFX_REF=8d87e5cae96c5fb25ac21442bb56c337029d77a4
ARG CORERT_REF=06c9c38fece653e1c8b1628908971edab183433c
ARG DIAGNOSTICS_REF=95e92dbc744e03995a2d2f8b30e457babac312aa
ARG CORESDK_REF=ed966bdcc5a68ec63074fb6ee579a5506328c2c7
ARG CORESETUP_REF=32228f2ae5e68394197859608c8c6afb94276481

# build and runtime dependencies
ENV DEBIAN_FRONTEND=noninteractive
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
        nuget \
    2>&1 && \
    curl -L https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
    apt-get update && apt-get -y install --no-install-recommends \
        cmake && \
    rm -rf /var/lib/apt/lists/*

COPY build.sh /dotnet/build.sh
COPY patch /dotnet/src/patch
RUN /dotnet/build.sh
ENV PATH="/dotnet/dist/bin:${PATH}"
COPY NuGet.Config /root/.nuget/NuGet/NuGet.Config
