#!/bin/bash

set -e
. mutil.sh

cd "${0%/*}"

no_cache=""
gover=1.10

eval "$(bashgetopt '
f              no_cache=--no-cache      # Don'\''t use cache
' "$@")"

ee docker build $no_cache -t golang-bash .
ee docker build $no_cache -t golang-zsh --build-arg shell=/usr/bin/zsh .
