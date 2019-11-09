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
$SCRIPT_ROOT/sdk/csc.sh
$SCRIPT_ROOT/sdk/crossgen.sh
$SCRIPT_ROOT/sdk/r2rdump.sh

$SCRIPT_ROOT/etc/nano.sh

$SCRIPT_ROOT/cleanup.sh
