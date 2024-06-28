#!/usr/bin/env bash
set -u
bash -c 'set -o pipefail'

#decrement wanted port -> while:do
wantedPort=$((($1) - 1))
notFree="notFree"

while [[ ! -z $notFree ]]; do
wantedPort=$((($wantedPort) + 1))
notFree=$(lsof -iTCP -sTCP:LISTEN -P | grep "${wantedPort}")
done

echo ${wantedPort}
