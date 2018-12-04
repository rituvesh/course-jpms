#!/bin/bash
set -e
source ../executables.sh

echo "--- LAUNCHING ---"

$JAVA --class-path 'libs/*':'jars/*' monitor.Main
