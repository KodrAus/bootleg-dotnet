# A local `dotnet` development environment

This repository contains a `Dockerfile` that installs a `dotnet` toolchain. The toolchain uses local builds for the runtime and libraries, and a published build for the SDK. The goal is to have a consistent environment that can be used to demonstrate features and functions of .NET using _debug builds_ and sources. It also gives you a sense of how the various components come together to make up the `dotnet` toolchain.

The toolchain is built using the following repositories:

- [`dotnet/coreclr`](https://github.com/dotnet/coreclr)
- [`dotnet/corefx`](https://github.com/dotnet/corefx)
- [`dotnet/corert`](https://github.com/dotnet/corert)
- [`dotnet/core-setup`](https://github.com/dotnet/core-setup)
- [`dotnet/core-sdk`](https://github.com/dotnet/core-sdk)
- [`dotnet/diagnostics`](https://github.com/dotnet/diagnostics)
- [`dotnet/llilc`](https://github.com/dotnet/llilc)

# Building it yourself

From the repository root, run:

```shell
$ docker build -t dotnet-dev:latest src
```

and be prepared to wait a _long_ time! The build is quite intensive, so if you're on Windows or OSX you might need to adjust your Docker resource limits.
