#!/usr/bin/env bash

if [[ -d logs ]]; then rm -rf logs; fi && mkdir "logs"

versions=$(cat "versions.txt")

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
