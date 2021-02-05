#!/bin/bash

set -e
. mutil.sh

cd "${0%/*}"

exec docker run -it -v $HOME:/mnt/host/home --rm ${1:-debian-latest} /bin/bash -l
