@echo off
CALL ..\executables.bat

echo ""
echo "Dependencies"
echo ""

%JDEPS% -summary -recursive --module-path mods;libs --module monitor

echo ""
echo "JDK-Internal APIs"
echo ""

%JDEPS% --jdk-internals -R --module-path mods;libs