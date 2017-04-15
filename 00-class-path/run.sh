echo "--- LAUNCHING ---"

java9 --class-path 'libs/*':'jars/*' monitor.Main

# TODO: figure out running as jar leads to not seeing libs on class-path (I guess manifest)
#java9 --class-path 'libs/*' -jar jars/monitor.jar
