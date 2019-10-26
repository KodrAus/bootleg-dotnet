# `coredistools`

This library is needed by `R2RDump` to dump the disassembly for libraries that are pre-JIT'd with `crossgen` (Ready to Run). The files are sourced from a few different repos:

- `coredistools.cpp` from `llilc`
- `coredistools.exports` from `llilc`
- `coredistools.h` from `coreclr`
- `CMakeLists.txt` adapted from `corert`'s `ObjWriter`
