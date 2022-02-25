#!/usr/bin/env bash
set -e

COVERAGE_OUT_FILE="${COVERAGE_FILES_NAME_PREFIX}cover.out"
COVERAGE_HTML_FILE="${COVERAGE_FILES_NAME_PREFIX}cover.html"

if [ ! -z ${BEFORE_RUN+x} ]; then
	bash -c "${BEFORE_RUN}"
fi

if [[ ${SINGLE_PACKAGE} == "true" ]]; then
	GO111MODULE=auto go test -coverprofile="${COVERAGE_OUT_FILE}" -p 1 ./...
else
	packages=$(bash /get_packages.sh)

	go test -coverprofile="${COVERAGE_OUT_FILE}" \
		-p 1 \
		-coverpkg=$(echo ${packages} | sed 's/ /,/g') \
		${packages}
fi

go tool cover -html "${COVERAGE_OUT_FILE}" -o "${COVERAGE_HTML_FILE}"
