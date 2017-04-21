# Multiple Modules

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

### Run Application In Unnamed Module

Section 00 showed how the unmodularized application could be launched from a single JAR on the class path.
What actually happened was that the unnamed module was created and contained the JARs content.
**Observe that the same happens with modules on the class path** by building modules and then running them from the class path as in section 00.
Look at the first line of output and how it changes when launching from module or class path.

To observe "the chaos of the class path" inside the unnamed module **do the following**:
* sever some of the requires connections between modules
* make them compile with the required command line arguments
* see the launch fail if used on the module path
* see the application run on the module path

### Create Automatic Modules

**Turn some suprojects into automatic modules** by packaging them without the module declaration (⇝ no longer a modular JAR) and still putting them on the module path.

Use the possibility, to **properly separate JARs on module and class path**.

## Observations

* the class path merges everything into one unnamed module
* the module path turns everything unto a module
* automatic modules are the bridge from modules to the class path
