#!/bin/bash

set -eu

cd "$(dirname "$0")" || exit

USERNAME=$(whoami)

if [ "${USERNAME}" != "root" ]; then
  err_msg="[ERROR]: Execute by root user"
  echo "$err_msg" >&2
  exit 1
fi

cp ./gpio-shutdown.service /etc/systemd/system/
cp ../build/bin/gpio-shutdown /opt/

systemctl enable gpio-shutdown
systemctl start gpio-shutdown
