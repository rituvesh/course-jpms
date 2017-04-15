#!/bin/bash
set -e
source ../executables.sh

echo "--- COMPILATION & PACKAGING ---"

echo " > creating clean directories"
rm -rf classes
mkdir classes
rm -rf mods
mkdir mods

# WITH MODULE-SOURCE-PATH

echo " > multi-compiling modules"
$JAVAC --module-path libs --module-source-path "./*/src/main/java" -d classes --module monitor

echo " > packaging modules"
$JAR --create --file mods/monitor.observer.jar -C classes/monitor.observer .
$JAR --create --file mods/monitor.observer.alpha.jar -C classes/monitor.observer.alpha .
$JAR --create --file mods/monitor.observer.beta.jar -C classes/monitor.observer.beta .
$JAR --create --file mods/monitor.statistics.jar -C classes/monitor.statistics .
$JAR --create --file mods/monitor.persistence.jar -C classes/monitor.persistence .
$JAR --create --file mods/monitor.rest.jar -C classes/monitor.rest .
$JAR --create --file mods/monitor.jar --main-class monitor.Main -C classes/monitor .

# WITHOUT MODULE-SOURCE-PATH

# echo " > building monitor.observer"
# $JAVAC -d classes/monitor.observer monitor.observer/src/main/java/module-info.java monitor.observer/src/main/java/monitor/observer/DiagnosticDataPoint.java monitor.observer/src/main/java/monitor/observer/ServiceObserver.java
# $JAR --create --file mods/monitor.observer.jar -C classes/monitor.observer .

# echo " > building monitor.observer.alpha"
# $JAVAC --module-path mods -d classes/monitor.observer.alpha monitor.observer.alpha/src/main/java/module-info.java monitor.observer.alpha/src/main/java/monitor/observer/alpha/AlphaServiceObserver.java
# $JAR --create --file mods/monitor.observer.alpha.jar -C classes/monitor.observer.alpha .

# echo " > building monitor.observer.beta"
# $JAVAC --module-path mods -d classes/monitor.observer.beta monitor.observer.beta/src/main/java/module-info.java monitor.observer.beta/src/main/java/monitor/observer/beta/BetaServiceObserver.java
# $JAR --create --file mods/monitor.observer.beta.jar -C classes/monitor.observer.beta .

# echo " > building monitor.statistics"
# $JAVAC --module-path mods -d classes/monitor.statistics monitor.statistics/src/main/java/module-info.java monitor.statistics/src/main/java/monitor/statistics/Statistics.java monitor.statistics/src/main/java/monitor/statistics/Statistician.java
# $JAR --create --file mods/monitor.statistics.jar -C classes/monitor.statistics .

# echo " > building monitor.persistence"
# $JAVAC --module-path mods -d classes/monitor.persistence monitor.persistence/src/main/java/module-info.java monitor.persistence/src/main/java/monitor/persistence/StatisticsRepository.java
# $JAR --create --file mods/monitor.persistence.jar -C classes/monitor.persistence .

# echo " > building monitor.rest"
# $JAVAC --module-path mods:libs -d classes/monitor.rest monitor.rest/src/main/java/module-info.java monitor.rest/src/main/java/monitor/rest/MonitorServer.java
# $JAR --create --file mods/monitor.rest.jar -C classes/monitor.rest .

# echo " > building monitor"
# $JAVAC --module-path mods -d classes/monitor monitor/src/main/java/module-info.java monitor/src/main/java/monitor/Monitor.java monitor/src/main/java/monitor/Main.java
# $JAR --create --file mods/monitor.jar --main-class monitor.Main -C classes/monitor .
