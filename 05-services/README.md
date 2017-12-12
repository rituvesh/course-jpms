# Services

Section goals:

* coding for services
* declaring services
* consuming services
* managing services by adding removing from module path


## Tasks

### Prepare Modules For Services

For the service loader to manage a class, it needs a no-args constructor.
This is currently not the case for the observer implementations and refactoring those classes to give them one makes them mutable, so we want to avoid that.
Instead, **create a `ServiceObserverFactory` interface in _monitor.observer_ and implementations in _alpha_ and _beta_**.

### Use Observer Implementations As Services

Using services requires two steps:

1. declare services in the implementation modules
2. consume services in the depending module

**Implement these steps with the observer implementation modules**, using the factories as services.

When removing the dependency of _monitor_ on the observer implementations, remember to also do it on the POM.

### Experiment With Module Path

Observe how easy it is to manage services by **adding them to or removing them from the module path**.

**Maven:**
I found no way to add the observer implementations to the module path that `mvn exec:exec` uses.
Without that this task can not be solved with Maven.
(You could mark the dependency with scope `runtime`, but that defeats the purpose of decoupling service consumer and provider.)

## Observations

* the detour via factory class with no-args-constructor is common
* consuming module no longer mentions service implementations ⇝ new implementations can come and go
* services that are found on the module path are included by default (unlike optional dependencies)
