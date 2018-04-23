#!/bin/bash
set -e
source ../executables.sh

echo "--- LAUNCHING ---"

$JAVA --class-path 'libs/*':'jars/*' monitor.Main

# TODO: figure out why running as jar leads to not seeing libs on class-path
#       (I guess manifest)
#$JAVA --class-path 'libs/*' -jar jars/monitor.jar
