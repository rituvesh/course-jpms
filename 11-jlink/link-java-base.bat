@echo off
CALL ..\executables.bat

echo "Creating java.base runtime"

del /s /q runtime-java-base > NUL
rmdir /s /q runtime-java-base

%JLINK% --add-modules java.base --output runtime-java-base

echo "Launching Monitor"

runtime-java-base\bin\java --module-path mods;libs --module monitor
