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

### Launch The Application

**Create a script `run.sh` that runs the application.**


## Observations

* the module path has first-level support for folders
* look into `jar --main-class` and how that changes the launch command
