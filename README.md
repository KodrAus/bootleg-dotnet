# A local `dotnet` development environment

[![Build Status](https://dev.azure.com/kodraus/dotnet-dev/_apis/build/status/KodrAus.dotnet-dev?branchName=master)](https://dev.azure.com/kodraus/dotnet-dev/_build/latest?definitionId=3&branchName=master)
[![Docker Hub](https://img.shields.io/badge/docker-kodraus%2Fdotnet--dev-blue)](https://hub.docker.com/r/kodraus/dotnet-dev)

This repository contains a `Dockerfile` that installs a `dotnet` toolchain. The toolchain uses local builds for the runtime and libraries, and a published build for the SDK. The goal is to have a consistent environment that can be used to demonstrate features and functions of .NET using _debug builds_ and sources. It also gives you a sense of how the various components come together to make up the `dotnet` toolchain.

## Source repositories

The toolchain is built using a number of repositories in the [`dotnet`](https://github.com/dotnet) organization on GitHub.

## [`coreclr`](https://github.com/dotnet/coreclr)
### `/dotnet/src/coreclr`

The .NET Core runtime. This is built in _checked_ mode so JIT internals are more accessible.

## [`corefx`](https://github.com/dotnet/corefx)
### `/dotnet/src/corefx`

The .NET standard libraries. These are built in _debug_ mode with symbols.

## [`corert`](https://github.com/dotnet/corert)
### `/dotnet/src/corert`

The ahead-of-time optimized compiler toolchain. This is built in _debug_ mode.

## [`llilc`](https://github.com/dotnet/llilc)
### `/dotnet/src/llvm`

An IL compiler based on LLVM with tools for producing and disassembling native objects.

## [`diagnostics`](https://github.com/dotnet/diagnostics)
### `/dotnet/src/diagnostics`

Tools for debugging .NET Core apps using LLDB.

## [`core-sdk`](https://github.com/dotnet/core-sdk)
### `/dotnet/src/core-sdk`

Aggregates an SDK from previously published sources.

## [`core-setup`](https://github.com/dotnet/core-setup)
### `/dotnet/src/core-setup`

Aggregates a runtime and libraries for a given platform.

## Layout

The toolchain is written to:

- `/dotnet/dist`
  - `/bin`: The SDK itself
  - `/packages`: Local package feed for the runtime and tools

## Building it yourself

From the repository root, run:

```shell
$ docker build -t dotnet-dev:latest src
```

and be prepared to wait a _long_ time! The build is quite intensive, so if you're on Windows or OSX you might need to adjust your Docker resource limits.
