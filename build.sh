#!/usr/bin/env bash

if [[ -d logs ]]; then rm -rf logs; fi && mkdir "logs"

versions=$(cat "versions.txt")

function build() {
  docker buildx create --use --name golang-test-buildx-instance >> logs/${version}.log 2>&1
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v8 -t "henri9813/golang-test:${version}" --build-arg "VERSION=${version}" --push . >> logs/${version}.log 2>&1
	docker system prune --all --force >>logs/${version}.log
	docker buildx rm golang-test-buildx-instance >> logs/${version}.log 2>&1
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
