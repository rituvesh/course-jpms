#!/bin/bash
set -e
source ../executables.sh

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

# run in unnamed module
$JAVA --class-path 'mods/*:libs/*' monitor.Main

# run with persistence, rest, and statistics as automatic modules
$JAVA --module-path mods --class-path 'libs/*' --module monitor
