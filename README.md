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

### PACKAGE_PREFIX

Required if you want to make your package importable from outside.

Example:
You have your project available in gitlab.com/test/mypackage and you want to import it on your project.

You will make `import gitlab.com/test/mypackage`.

However, if your package name ( in go.mod ), is not `gitlab.com/test/mypackage` it will fail.

Then you have to rename your package name in go.mod but you will not be able to do this because `golang-test` will use the relative package name: `mypackage` instead of `gitlab.com/test/mypackage`

### MAJOR_VERSION

Can't be used without `PACKAGE_PREFIX`.

When you release a major other than v0, v1, you must specify the Major version in your code.

You can follow clear explanation here:
https://medium.com/@elliotchance/major-versions-in-go-modules-explained-ec7c1df3888b
