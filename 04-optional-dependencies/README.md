# Optional Dependencies

Section goals:

* creating an optional dependency
* checking whether module is present
* using command line flags to add optional dependencies


## Tasks

### Make Dependency On Observer Implementations Optional

Change _monitor_'s module declaration so that **_monitor.observer.alpha_ and _monitor.observer.beta_ become optional dependencies**, i.e. are not required at launch time.
After observing how the code fails to run, **refactor it to handle absent dependencies**.

Tip: Have a look into `ModuleUtils`.

Maven has a scope that is usually used for optional run-time dependencies and it works here.
Apply it if you want.


### Add Modules On Launch

Experiment with the launch command and **add one or both observer implementations at launch time** with the `java` command line option `--add-modules ${module-name}`.

**Maven:**
If Maven was made aware that the observer implementations are optional at run time, the module path created for `mvn exec:exec` will not include them.
Unfortunately, I found no way to add the observer implementations to the module path so I think this task can not be solved with Maven.


## Observations

* modules are not added to module graph based on `requires static`
* code must be written carefully to not fail when dependency is absent
* situation is different if code can not be called without optional dependency being present
* services can be an alternative
* the `exec-maven-plugin` offers no way to add to the module path
