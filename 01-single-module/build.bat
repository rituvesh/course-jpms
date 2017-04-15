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

echo " > compiling monitor"
%JAVAC% --module-path libs -d classes src/main/java/module-info.java src\main\java\monitor\observer\beta\BetaServiceObserver.java src\main\java\monitor\observer\DiagnosticDataPoint.java src\main\java\monitor\observer\alpha\AlphaServiceObserver.java src\main\java\monitor\observer\ServiceObserver.java src\main\java\monitor\Monitor.java src\main\java\monitor\persistence\StatisticsRepository.java src\main\java\monitor\statistics\Statistics.java src\main\java\monitor\statistics\Statistician.java src\main\java\monitor\Main.java src\main\java\monitor\rest\MonitorServer.java

echo " > packaging monitor"
%JAR% --create --file mods\monitor.jar --main-class monitor.Main -C classes .
