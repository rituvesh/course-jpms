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
rem an easy way to create non-modular JARs is to delete the module descriptor before packaging the .class files
del classes\monitor.statistics\module-info.class
del classes\monitor.persistence\module-info.class
del classes\monitor.rest\module-info.class

%JAR% --create --file mods\monitor.observer.jar -C classes\monitor.observer .
%JAR% --create --file mods\monitor.observer.alpha.jar -C classes\monitor.observer.alpha .
%JAR% --create --file mods\monitor.observer.beta.jar -C classes\monitor.observer.beta .
%JAR% --create --file mods\monitor.statistics.jar -C classes\monitor.statistics .
%JAR% --create --file mods\monitor.persistence.jar -C classes\monitor.persistence .
%JAR% --create --file mods\monitor.rest.jar -C classes\monitor.rest .
%JAR% --create --file mods\monitor.jar --main-class monitor.Main -C classes\monitor .
