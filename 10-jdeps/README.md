# Jdeps

Section goals:

* using `jdeps` to explore dependencies
* using `jdeps` to look for JDK-internal APIs


## Tasks

### Dependencies

**Experiment with `jdeps`** to list dependencies of the monitor application.
Start with `jdeps9 --module-path mods:libs --module monitor` and take it from there.
Look into the options `-recursive`, `-summary` and those to filter dependencies

### Internal APIs

**Use the flag `--jdk-internals`** to determine where Monitor and its dependencies use internal APIs.


## Observations

* great way to see which modules need to be added to a runtime to support a particular application
* does not cover reflective access!
* good way to find dependencies on JDK-internal APIs
