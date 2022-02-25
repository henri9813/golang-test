#!/usr/bin/env bash

list=$(go list ./...)

# This function generate a sort of `grep -v -e ARG1 -e ARG2 ...`
function generate_filter_command() {
	filter_command="grep -v"
	for filter in ${1}; do
		filter_command="${filter_command} -e ${filter}"
	done

	echo "${filter_command}"
}

if [ -n "${EXCLUDED_PACKAGES}" ]; then
	list=$(echo "${list}" | $(generate_filter_command "${EXCLUDED_PACKAGES}"))
fi

echo "${list}"
