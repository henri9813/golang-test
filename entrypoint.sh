#!/usr/bin/env bash
set -e

project=$(basename $(pwd))
packages=$(bash /get_packages.sh)

if [ ! -z ${BEFORE_RUN+x} ]; then
	bash -c "${BEFORE_RUN}"
fi

if [ ! -z ${PACKAGE_PREFIX+x} ]; then
	project="${PACKAGE_PREFIX}${project}"
	packages=$(bash /get_packages.sh | awk -v PACKAGE_PREFIX=${PACKAGE_PREFIX} '{ print PACKAGE_PREFIX$1}')
fi

go test -coverprofile=cover.out \
	-coverpkg=$(echo ${packages} | sed 's/ /,/g'),${project} \
	${project} ${packages}

go tool cover -html cover.out -o cover.html
