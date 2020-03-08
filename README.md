# golang-test

Golang Test Container

This image will permit you to run all test of your project including automatically modules under `pkg` and `internal` directories.

## Usage

You can use it easily in a `docker-compose.yml`:
```yaml
version: '3'

services:
  test:
    image: henri9813/golang-test:1
    working_dir: $PWD
    volumes:
    - $PWD:$PWD
``` 

Here, is the result of analysing the `project` project
```
henri@henri-GL752VW:~/GolandProjects/golang-test$ docker-compose up test
Starting golang-test_test_1 ... done
Attaching to golang-test_test_1
test_1  | ?     project [no test files]
test_1  | ok    project/pkg/substration 0.001s  coverage: 33.3% of statements in project/pkg/substration, project
golang-test_test_1 exited with code 0
```
