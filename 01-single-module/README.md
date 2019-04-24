# A Single Module

Section goals:

* creating, compiling, and launching the first module
* getting used to new command line arguments


## Tasks

### Create A Module

Since the project is currently a monolith, the first step is to turn it into a single module.
To do this you need to **create a valid module declaration**.

Info: The Spark module is called `spark.core`.

### Build A Module

**Create a script `build.sh` that compiles the code as a module and packages it as a module JAR.**
For that the module declaration must be added to the list of files to compile.
Furthermore, because of the dependency on Spark, the corresponding module must be on the module path instead of the class path.

For building with Maven, run `mvn clean compile -X` and **have a look at the last debug block**.

When you think everything works as expected, use `jar --describe-module --file ${path-to-new-jar}` to take a look at the output.
It should start with these lines:

```
monitor jar:file:///path/to/monitor.jar/!module-info.class
requires java.base mandated
requires spark.core
...
```

### Launch The Application

**Create a script `run.sh` that runs the application.**

To execute with Maven, have a look at the `exec-maven-plugin` configuration and try to **adapt it to use the module path and set an initial module**.
Use `mvn exec:exec -X` to debug and verify your configuration.


## Observations

* the module path has first-level support for folders
* look into `jar --main-class` and how that changes the launch command
* the `maven-compiler-plugin` simply "does the right thing"
