# Bootleg .NET

[![Build Status](https://dev.azure.com/kodraus/bootleg-dotnet/_apis/build/status/KodrAus.bootleg-dotnet?branchName=master)](https://dev.azure.com/kodraus/bootleg-dotnet/_build/latest?definitionId=3&branchName=master)
[![Docker Hub](https://img.shields.io/badge/docker-kodraus%2Fbootleg--dotnet-blue)](https://hub.docker.com/r/kodraus/bootleg-dotnet)

This repository contains a `Dockerfile` that puts together a local debug build of some of the fundamental pieces of a `dotnet` toolchain:

- `csc`: A C# to IL compiler from [`roslyn`](https://github.com/dotnet/roslyn).
- `ilc`: An IL to native code compiler from [`corert`](https://github.com/dotnet/corert).
- `corerun`: An entry point to the runtime from [`coreclr`](https://github.com/dotnet/coreclr).
- `ildasm`: A tool for examining the IL in managed DLLs from [`coreclr`](https://github.com/dotnet/coreclr).
- `crossgen`: An IL to Ready-to-run DLL compiler from [`coreclr`](https://github.com/dotnet/coreclr) (based on [`corert`](https://github.com/dotnet/corert)).
- `r2rdump`: A tool for examining the native code in Ready-to-run DLLs from [`coreclr`](https://github.com/dotnet/coreclr).

Other sources include:

- [`corefx`](https://github.com/dotnet/corefx) for build-time core libraries.
- [`llilc`](https://github.com/dotnet/llilc) for LLVM dependencies used by `ilc` and `crossgen`.
- [`diagnostics`](https://github.com/dotnet/diagnostics) for debugging managed code with `lldb`.

## Building it yourself

From the repository root, run:

```shell
$ docker build -t bootleg-dotnet:latest src
```

and be prepared to wait a _long_ time! The build is quite intensive, so if you're on Windows or OSX you might need to adjust your Docker resource limits. The container is also _really big_.
