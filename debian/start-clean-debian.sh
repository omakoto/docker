#!/bin/bash

set -e
. mutil.sh

cd "${0%/*}"

exec sudo docker run -it --rm ${1:-debian-latest} /bin/bash -l
