@echo off
CALL ..\executables.bat

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

%JAVA% --class-path "libs\*";"jars\*" monitor.Main
