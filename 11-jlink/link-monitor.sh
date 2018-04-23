#!/bin/bash
set -e
source ../executables.sh

echo "Creating Monitor runtime"

rm -rf runtime-monitor
$JLINK \
	--module-path mods \
	--add-modules monitor,monitor.observer.alpha,monitor.observer.beta \
	--launcher monitor=monitor \
	--output runtime-monitor

echo "Launching Monitor"

runtime-monitor/bin/monitor
