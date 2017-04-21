#!/bin/bash

echo "--- COMPILATION & PACKAGING ---"

echo " > creating clean directories"
rm -rf classes
mkdir classes
rm -rf mods
mkdir mods

echo " > multi-compiling modules"
javac9 --module-path libs --module-source-path "./*/src/main/java" -d classes --module monitor --add-modules monitor.observer.alpha,monitor.observer.beta

echo " > packaging modules"
jar9 --create --file mods/monitor.observer.jar -C classes/monitor.observer .
jar9 --create --file mods/monitor.observer.alpha.jar -C classes/monitor.observer.alpha .
jar9 --create --file mods/monitor.observer.beta.jar -C classes/monitor.observer.beta .
jar9 --create --file mods/monitor.statistics.jar -C classes/monitor.statistics .
jar9 --create --file mods/monitor.persistence.jar -C classes/monitor.persistence .
jar9 --create --file mods/monitor.rest.jar -C classes/monitor.rest .
jar9 --create --file mods/monitor.jar --main-class monitor.Main -C classes/monitor .
