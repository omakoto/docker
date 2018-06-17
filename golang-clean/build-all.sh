#!/bin/bash

set -e
. mutil.sh

cd "${0%/*}"

no_cache=""
gover=1.10
opt_packages=""

eval "$(bashgetopt '
f              no_cache=--no-cache      # Don'\''t use cache
o=s            opt_packages=%           # Optional APT packages
' "$@")"

ee docker build $no_cache -t golang-bash --build-arg opt_packages="$opt_packages" .
ee docker build $no_cache -t golang-zsh  --build-arg opt_packages="$opt_packages" --build-arg shell=/usr/bin/zsh .
