# golang-test

Golang Test Container

This image permits to run all the tests of your project, automatically including modules under `pkg` and `internal` directories.

## Supported tags

Supported tags are defined in the `versions.txt`.

If you want a new tag, you can make a Merge request and update this file.

## Usage

You can use it easily in a `docker-compose.yml`:

```yaml
version: "3"

services:
  test:
    image: henri9813/golang-test:1
    working_dir: $PWD
    volumes:
      - $PWD:$PWD
```

Here is the tests result:

```
$ docker-compose up test
Starting golang-test_test_1 ... done
Attaching to golang-test_test_1
test_1  | ?     project [no test files]
test_1  | ok    project/pkg/substration 0.001s  coverage: 33.3% of statements in project/pkg/substration, project
golang-test_test_1 exited with code 0
```

## Environments Variables

### BEFORE_RUN

Execute a script before run the tests ( usefull for preseeding a databse for example )

### SINGLE_PACKAGE

Set to `true` if you are running a package without `go.mod`.

this permit to avoid this error:

```
cannot find package "." in:
        /my_package
```

### EXCLUDED_PACKAGES

Permit to define a list of packages separated by spaces to exclude from the test.

Example:
```
export EXCLUDED_PACKAGES="pkg/addition internal/excludedpackage1"
```

### COVERAGE_FILES_NAME_PREFIX

Permit to add a `COVERAGE_FILES_NAME_PREFIX` before the `cover.out` and `cover.html`.

Example:

```
export COVERAGE_FILES_NAME_PREFIX=project1_
...
$ ls
...
project1_cover.html
project1_cover.out
```
