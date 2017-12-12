# Automatic And Unnamed Modules

Section goals:

* use `java --list-modules` to examine modules
* understanding why the class path "just works"
* using automatic modules for stepwise modularization


## Tasks

### Time For Honesty

To offer the REST service _monitor.rest_ uses Spark by requiring _spark.core_ (**have a look at the module declaration**).
But spark is no module.
We've been using automatic modules all the time!

With `java --describe-module` you can examine individual modules:

```bash
java --module-path mods:libs
	--describe-module <module-name>
```

Examine the modules we created so far as well as _spark.core_ or others in `lib`.

Note that Maven automatically did the right thing.
After building the entire project, go into `monitor`, run `mvn clean compile -X`, and have a look at the last block of debug messages.
You will see how the class and module path are composed.

### Run Application In Unnamed Module

Section _00 Class Path_ showed how the unmodularized application could be launched from a single JAR on the class path.
What actually happened was that the unnamed module was created and contained the JARs content.
**Observe that the same happens with modules on the class path** by building modules and then running them from the class path as in section 00.
Look at the first line of output and how it changes when launching from module or class path.

To observe "the chaos of the class path" inside the unnamed module **do the following**:

* sever some of the required connections between modules
* make them compile with the required command line arguments
* see the launch fail if used on the module path
* see the application run on the class path

To solve this with Maven, take a look back at task _02 Multiple Modules_, where the exec plugin was configured to run from the module path instead of the class path.

### Create Automatic Modules

**Turn some suprojects into automatic modules** by packaging them without the module declaration (⇝ no longer a modular JAR) and still putting them on the module path.

Use the possibility to **properly separate JARs on module and class path**.
(Maven does this on its own.)


## Observations

* the class path merges everything into one unnamed module
* the module path turns everything unto a module
* automatic modules are the bridge from modules to the class path
* Maven places exactly the artifacts required by the module declaration onto the module path and the rest onto the class path, regardless of whether they are modular or plain JARs
