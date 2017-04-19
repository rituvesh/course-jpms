@echo off
CALL ..\executables.bat

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

rem run in unnamed module
%JAVA% --class-path "mods/*";"libs/*" monitor.Main

rem run with persistence, rest, and statistics as automatic modules
%JAVA% --module-path mods --class-path "libs/*" --module monitor
