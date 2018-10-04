# Class Path

Section goals:

* setting up a current Java version (11 or later)
* getting used to the code base
* observing that a module-free application works just the same as on Java 8


## Tasks

### Install Recent Java

First, download and unpack/install the most recent [OpenJDK](http://jdk.java.net).

#### To Build From Command Line

If you want to build with the command line scripts, but Java 11+ is not your default install, edit `executables.sh` in the project's root directory (i.e. the one above this one) to point to the correct executables.

These are all Linux scripts, but adapting them to Windows is straightforward.

#### To Build With Maven

If you want to build with Maven, install version 3.5.0+.
Java 11+ is not your default install, create a file `.mavenrc` in your home directory and set `JAVA_HOME` to your JDK 11+ install:

```
JAVA_HOME=${path-to-jdk-11}
```

Now the output of `mvn -v` should say it runs on Java 11:

```
Java version: 11, vendor: Oracle Corporation
```

To execute the project with `mvn exec:exec` you need to set the path to your JDK 11+ install in the the POM in the project's root directory (i.e. the one above this one) and then build it once with `mvn clean install`.

**A word of warning regarding Maven:**
Maven supports the module system quite well, but it is often not flexible enough to properly explore it.
As such, a number of exercises can not be solved with Maven.

### Browse The Project

The _Monitor_ application observes a bunch of (micro?) services and collects liveness data.
It aggregates the data into statistics that are persisted and made available via REST.

You can import the project into your favorite IDE if you want (it has to be Java 11 compatible and you have to point towards `jdk-11` or you will see compile errors) but a text editor is fine as well.
Have a look at the code.

### Compile And Run

#### Command Line

Have a look at `build.sh` and `run.sh`.
Aside from the new long-form and GNU-style arguments, this is standard Java stuff.
Executing `build.sh` should result in `monitor.jar` in `jars`, which can be executed with `run.sh`, starting up the application.

When the application runs, have a look at http://localhost:4567/statistics (e.g. with `curl`) and you should see some ugly JSON.

#### Maven

To build and run with Maven:

```
mvn install
mvn exec:exec
```


## Observations

* the new command line flags make everything clearer
* Maven works fine on Java 11
