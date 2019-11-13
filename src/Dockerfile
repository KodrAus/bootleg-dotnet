FROM ubuntu:18.04

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
        nano \
        tree \
        radare2 \
    2>&1 && \
    curl -L https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
    apt-get update && apt-get -y install --no-install-recommends \
        cmake && \
    rm -rf /var/lib/apt/lists/*

ARG CLEAN_SRC=0
ARG CORECLR_REF=9db8990bca7e0f44f60494d2608342a930d484ca
ARG LLVM_REF=6a075b6de4cafebec9ca1ff9eec7229a617c93f6
ARG COREFX_REF=8d87e5cae96c5fb25ac21442bb56c337029d77a4
ARG CORERT_REF=06c9c38fece653e1c8b1628908971edab183433c
ARG DIAGNOSTICS_REF=95e92dbc744e03995a2d2f8b30e457babac312aa
ARG ROSLYN_REF=7d97db435f1d30285efdc8f77e1d573ea8b5075a

COPY build /dotnet/build
COPY patch /dotnet/src/patch

RUN /dotnet/build/build.sh
RUN apt-get remove -y nuget

COPY dist /dotnet/dist

ENV PATH="/dotnet/dist:${PATH}"
ENV CLR_DIR=/dotnet/dist/clr
ENV RT_DIR=/dotnet/dist/rt
ENV FX_DIR=/dotnet/dist/fx
ENV SOS_DIR=/dotnet/dist/sos
