# Patches

This directory contains patches to parts of the toolchain so that we can link together local builds. Most repositories in the `dotnet` organization depend on eachother loosely through package feeds, so with a few simple tweaks to package versions and feed locations we can point them at our locally built packages instead of external ones.
