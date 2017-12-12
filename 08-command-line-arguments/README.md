# Command Line Arguments

Section goals:

* use command line arguments to edit module graph


## Tasks

### Compile And Launch

The task is seemingly simple:
**Compile and launch the application**.
The problem is that the module declarations lack certain information and _you are not allowed to edit them_ - reach your goal with command line arguments only.

**Maven**:
The Maven build is broken just as much as build and run scripts.
But, unlike them, I could not fix it because I could not move dependencies from class to module path during compilation.
Unless you find a way to do that, this task can not be solved with Maven.

## Observations

* not all error messages are equally helpful
* if something "does not exist", the owning can module might be missing (⇝ `--add-modules`), might not be readable (⇝ `--add-reads`), or the package might not be exports (⇝ `--add-exports`)
* `java` and `javac` behave similarly but not identically
