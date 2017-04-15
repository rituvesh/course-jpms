# Implied Readability

Section goals:

* using implied readability
* creating an aggregator module


## Steps

### Make Observer Implementations Stand On Their Own

As it stands, modules using _monitor.observer.alpha_ or _monitor.observer.beta_ must also require _monitor.observer_.
**Use implied readability to remedy that.**

To see it in action have a look at `Main`, which now only uses _alpha_ and does not want to depend on the abstraction.
When implied readability is used correctly, _monitor_ no longer needs to require _monitor.observer_ - update the _monitor_'s module declaration accordingly.

### Make Other Modules Stand On Their Own

Have a look at the other modules and **decide which ones should imply readability** on their dependencies.
Check which `requires` clauses could and should be removed as a result of that.

### Create An Aggregator Module

Under the assumption that many other modules want to use the _monitor.observer.*_ modules, **create an aggregator module _monitor.observation_** that uses implied readability to forward dependency on all three modules.
Make _monitor_ depend on that module.


## Observations

* should only be used when dependency is exposed
* should only be relied upon when exposed module is used "close to" exposing module
* implied readability can be used to split modules up (aggregator modules) or merge them
* multi-module build applies optimizations that might be undesired
* optional dependency can be an alternative
