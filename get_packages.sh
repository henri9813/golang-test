#!/usr/bin/env bash

function getGoFiles() {
	golangPaths=(internal pkg)

	for golangPath in ${golangPaths[@]}; do
		if [[ ! -d ${golangPath} ]]; then
			continue
		fi

		packages=$(find "${golangPath}" -name "*.go")
		for path in ${packages}; do
			echo "$(basename $(pwd))/$(dirname "${path}")"
		done
	done

}

getGoFiles | sort | uniq
