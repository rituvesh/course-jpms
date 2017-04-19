@echo off
CALL ..\executables.bat

echo ""
echo "--- LAUNCH ---"

echo " > run monitor"
echo ""

%JAVA% --module-path libs;mods^
	--add-modules monitor.rest^
	--add-reads monitor=monitor.rest^
	--add-exports monitor.rest/monitor.rest=monitor^
	--add-opens monitor.persistence/monitor.persistence.dtos=hibernate^
	--module monitor
