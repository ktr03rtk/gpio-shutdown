#!/bin/sh

dir="$(dirname "$0")"
cd "$dir" || exit

docker-compose build
docker run -v "$(pwd)"/bin:/go/src/app/build/bin builder
