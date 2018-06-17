#!/bin/bash

set -e
. mutil.sh

cd "${0%/*}"

exec docker run -it --rm ${1:-debian-latest}
