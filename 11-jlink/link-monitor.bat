@echo off
CALL ..\executables.bat

echo "Creating java.base runtime"

del /s /q runtime-monitor > NUL
rmdir /s /q runtime-monitor

%JLINK% --module-path mods --add-modules monitor,monitor.observer.alpha,monitor.observer.beta --launcher monitor=monitor --output runtime-monitor

echo "Launching Monitor"

runtime-monitor/bin/monitor
