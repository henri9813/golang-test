#!/usr/bin/env bash
set -e

project=$(basename $(pwd))

if [ ! -z ${BEFORE_RUN+x} ]; then
	bash -c "${BEFORE_RUN}"
fi

if [ ! -z ${MAJOR_VERSION+x} ]; then
	project="${project}/${MAJOR_VERSION}"
fi

if [ ! -z ${PACKAGE_PREFIX+x} ]; then
	project="${PACKAGE_PREFIX}${project}"
fi

packages=$(bash /get_packages.sh "${project}")


go test -coverprofile=cover.out \
	-coverpkg=$(echo ${packages} | sed 's/ /,/g'),${project} \
	${project} ${packages}

go tool cover -html cover.out -o cover.html
