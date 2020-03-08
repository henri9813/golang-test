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

And bellow, this is the result:
```
test_1  | warning: no packages being tested depend on matches for pattern 
test_1  | ?     pdf-parser      [no test files]
pdf-parser_test_1 exited with code 0
```
