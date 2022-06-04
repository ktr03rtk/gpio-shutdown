#!/bin/bash

set -eu

cd "$(dirname "$0")" || exit

USERNAME=$(whoami)

if [ "${USERNAME}" != "root" ]; then
  err_msg="[ERROR]: Execute by root user"
  echo "$err_msg" >&2
  exit 1
fi

curl -L https://github.com/ktr03rtk/gpio-shutdown/releases/download/v1.0.0/gpio-shutdown.zip -o gpio-shutdown.zip
unzip gpio-shutdown.zip
rm gpio-shutdown.zip
mv ./gpio-shutdown.service /etc/systemd/system/
mv ./gpio-shutdown /opt/

systemctl enable gpio-shutdown
systemctl start gpio-shutdown
