#!/bin/bash
set -e
source ../executables.sh

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

$JAVA --class-path 'libs/*':'jars/*' monitor.Main
