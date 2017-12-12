# JLink

Section goals:

* using jlink to create small Java runtime images
* using jlink to create application runtime images

## Tasks

### Create A Minimal Runtime

Use `jlink` to **create a runtime containing only _java.base_** and **launch Monitor with it**.
Have a look at the image size.

### Create A Monitor Image

**Try to build an image of the Monitor application** and see it fail due to the dependency on automatic modules.
**Remove automatic modules** by deleting the corresponding features (also from the Maven POM), then build and run an image.
**Use the `jlink` option `--launcher`.**

Have a look at the image size.


## Observations

* good to know which modules an application needs (⇝ `jdeps`)
* services must be added manually or with `--bind-services`; the latter also binds services in the JDK, which leads to a larger image
* automatic modules are not included makes it hard to use for legacy projects
