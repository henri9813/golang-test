#!/usr/bin/env bash

project=$(shell basename $(CURDIR))
packages=$(shell bash /get_packages.sh)

if [ -z ${BEFORE_RUN} ]
then
  bash ${BEFORE_RUN}
fi

go test -coverprofile=cover.out \
	-coverpkg=$(shell echo $(packages) | sed 's/ /,/g'),$(project) \
	$(project) $(packages)
