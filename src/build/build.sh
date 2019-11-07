#!/bin/bash

set -o errexit -o nounset

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$SCRIPT_ROOT/src.sh

$SCRIPT_ROOT/platform/llvm.sh
$SCRIPT_ROOT/platform/coreclr.sh
$SCRIPT_ROOT/platform/corefx.sh
$SCRIPT_ROOT/platform/corert.sh

$SCRIPT_ROOT/sdk/diagnostics.sh
$SCRIPT_ROOT/sdk/roslyn.sh

# TODO: Do we still need to wrap these ILC invocations like this?
echo "Compiling csc with ilc..."
0<&- script -qefc "$SCRIPT_ROOT/sdk/csc.sh" /dev/null | cat

echo "Compiling crossgen with ilc..."
0<&- script -qefc "$SCRIPT_ROOT/sdk/crossgen.sh" /dev/null | cat

echo "Compiling r2rdump with ilc..."
0<&- script -qefc "$SCRIPT_ROOT/sdk/r2rdump.sh" /dev/null | cat

$SCRIPT_ROOT/cleanup.sh
