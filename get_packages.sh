#!/usr/bin/env bash

function getGoFiles() {
	packages=$(find "internal" "pkg" -name "*.go")
	for path in ${packages}; do
		echo "$(basename $(pwd))/$(dirname "${path}")"
	done
}

getGoFiles | sort | uniq
