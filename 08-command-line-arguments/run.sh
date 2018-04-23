#!/bin/bash
set -e
source ../executables.sh

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

$JAVA --module-path libs:mods \
	--module monitor
