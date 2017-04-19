#!/bin/bash

echo "--- COMPILATION & PACKAGING ---"

echo " > creating clean directories"
rm -rf classes
mkdir classes
rm -rf mods
mkdir mods

echo " > multi-compiling modules"
javac9 --module-path libs --module-source-path "./*/src/main/java" -d classes --module monitor

echo " > packaging modules"
jar9 --create --file mods/monitor.jar --main-class monitor.Main -C classes/monitor .

echo ""
echo "/-----------------------\\"
echo "| PACKAGE MORE MODULES! |"
echo "\\-----------------------/"
echo ""
