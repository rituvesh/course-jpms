#!/bin/bash
set -e
source ../executables.sh

echo "Creating java.base runtime"

rm -rf runtime-java-base
$JLINK \
	--add-modules java.base \
	--output runtime-java-base

echo "Launching Monitor"

runtime-java-base/bin/java --module-path mods:libs --module monitor
