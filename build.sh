#!/bin/bash

set -e

if echo "$1" | grep -v -E '^[0-9]+\.[0-9]+\.[0-9]+$' &>/dev/null; then
	echo "Please inform the version of serf. e.g. 0.6.4"
	exit 1
fi

wget -O serf.zip https://dl.bintray.com/mitchellh/serf/${1}_linux_amd64.zip
unzip serf.zip
docker build -t txgruppi/busyserf:$1 .
rm serf.zip serf
