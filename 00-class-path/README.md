# Class Path

Section goals:

* setting up Java 9
* getting used to the code base
* observing that a module-free application works just the same as before Java 9

## Tasks

### Install Java 9

* download [JDK 9 EA with Jigsaw](http://jdk.java.net/jigsaw/)
* unpack into a folder with build number, e.g. `jdk-9-b164`
* symlink `jdk-9` to that folder (makes it easy to update)
* symlink `javac9`, `jar9`, `java9`, and `jdeps9` to respective command in `jdk-9/bin/`

Refresher on symlinks:

* [on Linux](http://stackoverflow.com/a/1951752/2525313):
* [on Windows](https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/)

Now `java9 --version` should output something like:

```
java 9-ea
Java(TM) SE Runtime Environment (build 9-ea+164-jigsaw-nightly-...)
Java HotSpot(TM) 64-Bit Server VM (build 9-ea+164-jigsaw-nightly-..., mixed mode)
```

### Browse The Project

The _Monitor_ application observes a bunch of (micro?) services and collects liveness data.
It aggregates the data into statistics that are persisted and made available via REST.

You can import the project into your favorite IDE if you want (it has to be Java 9 compatible and you have to point towards `jdk-9` or you will see compile errors) but a text editor is fine as well.
Have a look at the code.

### Compile And Run

Have a look at `build.sh` and `run.sh`.
Aside from the new long-form and GNU-style arguments, this is standard Java stuff.
Executing `build.sh` should result in `monitor.jar` in `jars`, which can be executed with `run.sh`, starting up the application.

When the application runs, have a look at http://localhost:4567/statistics (e.g. with `curl`) and you should see some ugly JSON.


## Observations

* the new command line flags make everything clearer
