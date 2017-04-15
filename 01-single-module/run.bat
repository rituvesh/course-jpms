@echo off
CALL ..\executables.bat

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

%JAVA% --module-path libs;mods --module monitor
