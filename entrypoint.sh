#!/usr/bin/env bash
set -e

project=$(basename $(pwd))

if [ ! -z ${BEFORE_RUN+x} ]; then
	bash -c "${BEFORE_RUN}"
fi

if [[ ${SINGLE_PACKAGE} == "true" ]]
then
  GO111MODULE=off go test -coverprofile=cover.out -p 1 ./...
else
  if [ ! -z ${MAJOR_VERSION+x} ]; then
    project="${project}/${MAJOR_VERSION}"
  fi

  if [ ! -z ${PACKAGE_PREFIX+x} ]; then
    project="${PACKAGE_PREFIX}${project}"
  fi

  packages=$(bash /get_packages.sh "${project}")

  go test -coverprofile=cover.out \
  -p 1 \
	-coverpkg=$(echo ${packages} | sed 's/ /,/g'),${project} \
	${project} ${packages}
fi

go tool cover -html cover.out -o cover.html
