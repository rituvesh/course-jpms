# Multiple Modules

Section goals:

* creating, compiling, and launching an application made up of several modules
* understanding how the module system enforces reliable configuration and strong encapsulation


## Steps

### Browse The Project

The project was split into a few subprojects - have a look at those and get a feeling for their relationships.

### Create Modules

Turn each subproject into a module as in the previous step.
Note that this requires you to add module dependencies between the subprojects and to export packages.

### Build Modules

**Create a script `build.sh` that compiles and packages all modules.**
Maybe start by doing the same as in the previous step for each module but instead of going down that cumbersome road, create a multi-module build with the `javac` arguments `--module-source-path` and `--module`

_Info_: To compile multiple modules at once, the module system needs to know where to find the sources for individual modules.
This can be specified with a generalized version of the path to the sources, where the module name is replaced by a star (`*`):

`--module-source-path './*/src/main/java'`

(The leading `./` is required because otherwise the module system does not accept the star.)

### Launch The Application

**Create a script `run.sh` that runs the application.**

### Break The Application

In case you didn't get any errors while creating the modules in the first place, **leave out some dependencies and exports** to see how the module system reacts _at compile time_.

Try to create the same failure situations _at launch time_ by **selectively creating modular JARs that lack a dependency or export** and see how the module system reacts then.

Also have a look into the `java` argument `--dry-run`.


## Observations

* multi-module compilation operates on a higher level of abstraction that does not require listing source files
* the module system operates very similarly at compile and run time
* `--dry-run` is very handy to build a command without always launching the app
