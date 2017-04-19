# Open Packages And Modules

Section goals:

* open code to reflection without exporting


## Steps

### Analyze The Situation

Because the real _Hibernate_ is unfortunately not yet fit for Java 9 (more precisely its dependency _ASM_), I created a mock that uses reflection (like the real version) to demonstrate the problems and solutions.
**Have a look at the mock** and convince yourself that it does make a small amount of sense.

**Have a look into _monitor.persistence_/`monitor.persistence.dtos`** to see that entities were specifically created for persistence.
(Hibernate annotations are commented out.)

Finally, **run the application** and observe the result.

### Open The Package

**Open the package in question** to allow reflection to access it.

### Open The Module

**Open the entire module** to allow reflection to access it.


## Observations

* the error message is pretty helpful
* try using public types in open packages to see that this is not possible
* open modules can be a simple way to stop worrying if reflection is prevalent
