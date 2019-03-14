@echo off
CALL ..\executables.bat

echo "--- COMPILATION & PACKAGING ---"

echo " > creating clean directories"
del /s /q classes > NUL
rmdir /s /q classes
mkdir classes
del /s /q mods > NUL
rmdir /s /q mods
mkdir mods

echo " > multi-compiling modules"
%JAVAC% --module-path libs --module-source-path ".\*\src\main\java" -d classes --module monitor

echo " > packaging modules"
%JAR% --create --file mods\monitor.observer.jar -C classes\monitor.observer .
%JAR% --create --file mods\monitor.observer.alpha.jar -C classes\monitor.observer.alpha .
%JAR% --create --file mods\monitor.observer.beta.jar -C classes\monitor.observer.beta .
%JAR% --create --file mods\monitor.statistics.jar -C classes\monitor.statistics .
%JAR% --create --file mods\monitor.persistence.jar -C classes\monitor.persistence .
%JAR% --create --file mods\monitor.rest.jar -C classes\monitor.rest .
%JAR% --create --file mods\monitor.jar --main-class monitor.Main -C classes\monitor .
