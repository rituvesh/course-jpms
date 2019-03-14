# Class Path

Section goals:

* setting up a current Java version (11 or later)
* getting used to the code base
* observing that a module-free application works just the same as on Java 8


## Tasks

### Install Recent Java

First, download and unpack/install the most recent [OpenJDK](http://jdk.java.net).

#### Configure Executables For Scripts

The best way to learn about the module system is the command line.
Hence, most exercises task you to write scripts like `build.*` and `run.*` in this folder.

These scripts need to reference your Java 11 executables, e.g. `javac` and `java`.
If Java 11+ is not your default install, edit `executables.sh` (on Linux or MacOS) or `executables.bat` (on Windows) in the project's root directory (i.e. the one above this one) to point to the correct executables.

#### Configure Maven

If the command line isn't right for you and you want to use Maven instead, install version 3.5.0+.
If Java 11+ is not your default install, create a file `.mavenrc` in your home directory and set `JAVA_HOME` to your JDK 11+ install:

```
JAVA_HOME=${path-to-jdk-11}
```

Now the output of `mvn -v` should say it runs on Java 11:

```
Java version: 11.0.1
```

**A word of warning regarding Maven:**
Maven supports the module system quite well, but it is often not flexible enough to properly explore it.
As such, a number of exercises can not be solved with Maven.

### Browse The Project

The _Monitor_ application observes a bunch of (micro?) services and collects liveness data.
It aggregates the data into statistics that are persisted and made available via REST.

You can import the project into your favorite IDE if you want (it has to be Java 11 compatible and you have to point towards `jdk-11` or you will see compile errors) but a text editor is fine as well.
Each section has its own project and they should all be imported individually.
While that is a little cumbersome, it's much more stable than importing the project from the root directory.

Have a look at the code.

### Build And Run The Project

#### From The Command Line

You can build from the command line by executing the script `build.sh` (on Linux or MacOS) or `build.bat` (on Windows) next to this README.
This should result in a file `monitor.jar` in the folder `jars`.
You can execute that JAR with `run.sh` (on Linux or MacOS) or `run.bat` (on Windows)
When the application runs, have a look at http://localhost:4567/statistics (e.g. with `curl`) and you should see some ugly JSON.

Have a look at `build.*` and `run.*` - aside from the new long-form and GNU-style arguments, this is standard Java stuff.
If you need to write scripts in future sections, check out [this cheat sheet](https://blog.codefx.org/cheat-sheet-build-run-modules-jars.html) for `javac`, `jar`, and `java`.

#### With Maven

To build and run with Maven:

```
mvn install
mvn exec:exec
```


## Observations

* the new command line flags make everything clearer
* Maven works fine on Java 11
