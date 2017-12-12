# Qualified Exports

Section goals:

* using qualified exports


## Tasks

### Limit Accessibility Of Utility Package

The module _monitor.observer_ got a utility package `monitor.observer.utils`, which the observer implementations use.
Currently all other module can use it too, though, which is undesired.
**Use qualified exports to make sure only the observer implementations see the package.**

**Maven:**
The project uses services, which I could not add to `mvn exec:exec`, so if the application is executed that way, it will find no observer implementations and report no liveness data.
As a consequence, with Maven, qualified exports can only be observed during compilation not at run time.

## Observations

* circular references are possible if they are not `requires` clauses; they are still dubious, though, and often undesired (like in this case)
* qualified exports allow encapsulating a package within a set of modules much like strong encapsulation allows encapsulating a public type within a module
