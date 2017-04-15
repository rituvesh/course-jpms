# Optional Dependencies

Section goals:

* creating an optional dependency
* checking whether module is present
* using command line flags to add optional dependencies


## Steps

### Make Dependency On Observer Implementations Optional

Change _monitor_'s module declaration so that **_monitor.observer.alpha_ and _monitor.observer.beta_ become optional dependencies**, i.e. are not required at launch time.
After observing how the code fails to run, **refactor it to handle absent dependencies**.

Tip: Have a look into `ModuleUtils`.


### Add Modules On Launch

Experiment with the launch command and **add one or both observer implementations at launch time**.


## Observations

* modules are not added to module graph based on `requires static`
* code must be written carefully to not fail when dependency is absent
* situation is different if code can not be called without optional dependency being present
* services can be an alternative
