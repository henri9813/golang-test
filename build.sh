#!/usr/bin/env bash
set -e

versions=$(wget -q https://registry.hub.docker.com/v1/repositories/golang/tags -O -  \
 | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' \
 | tr '}' '\n' \
 | awk -F: '{print $3}')

for version in ${versions}
do
  echo the version is $version
  docker build -t "henri9813/golang-test:${version}" --build-arg "VERSION=${version}" .
  docker push "henri9813/golang-test:${version}"
done
