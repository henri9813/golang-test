#!/usr/bin/env bash

project=$(basename $(pwd))
packages=$(bash /get_packages.sh)

if [ ! -z ${BEFORE_RUN+x} ]
then
	bash -c "${BEFORE_RUN}"
fi

go test -coverprofile=cover.out \
	-coverpkg=$(echo ${packages} | sed 's/ /,/g'),${project} \
	${project} ${packages}
