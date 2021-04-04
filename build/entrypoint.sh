#!/bin/sh

cd "$(dirname "$0")" || exit

cp -f /go/bin/gpio-shutdown /go/src/app/build/bin
