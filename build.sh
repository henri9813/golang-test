#!/usr/bin/env bash

if [[ -d logs ]]; then rm -rf logs; fi && mkdir "logs"

versions=$(wget -q https://registry.hub.docker.com/v1/repositories/golang/tags -O - |
	sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' |
	tr '}' '\n' |
	awk -F: '{print $3}' |
	grep -v nano | grep -v windows | grep -v cross | grep -v onbuild)

function build() {
	docker build -t "henri9813/golang-test:${version}" --build-arg "VERSION=${version}" . >>logs/${version}.log
	docker push "henri9813/golang-test:${version}" >>logs/${version}.log
	docker system prune --all --force >>logs/${version}.log
}

i=1
total=$(echo ${versions[@]} | tr ' ' '\n' | wc -l)

for version in ${versions[@]}; do
	echo -n "[ ${i} / ${total} ] Building: ${version}"

	start_time="$(date -u +%s)"
	build "${version}"
	end_time="$(date -u +%s)"

	echo " - $(($end_time - $start_time))s"
	i=$((i + 1))
done
