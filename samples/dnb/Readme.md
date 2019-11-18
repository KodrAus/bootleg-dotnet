# `dnb` samples

This directory contains samples that can be built and inspected within a `bootleg-dotnet` container. They each demonstrate some different aspect of compilation/execution using standard .NET tools.

## Useful environment variables

You can watch the JIT do its thing using the `COMPlus_JitDisasm` environment variable. For example:

```
COMPlus_JitDisasm="App.Program:*"
```

will dump the JIT'ed assembly for all methods under the `App.Program` class to the terminal.
