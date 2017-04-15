# Services

Section goals:

* coding for services
* declaring services
* consuming services
* managing services by adding removing from module path


## Steps

### Prepare Modules For Services

For the service loader to manage a class, it needs a no-args constructor.
This is currently not the case for the observer implementations and refactoring those classes to give them one makes them mutable, so we want to avoid that.
Instead, **create a `ServiceObserverFactory` interface in _monitor.observer_ and implementations in _alpha_ and _beta_**.

### Use Observer Implementations As Services

Using services requires two steps:

1. declare services in the implementation modules
2. consume services in the depending module

**Implement these steps with the observer implementation modules**, using the factories as services.

### Experiment With Module Path

Observe how easy it is to manage services by **adding them to or removing them from the module path**.


## Observations

* the detour via factory class with no-args-constructor is common
* consuming module no longer mentions service implementations ~> new implementations can come and go
* services that are found on the module path are included by default (unlike optional dependencies)
