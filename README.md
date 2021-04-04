# gpio-shutdown

shutdown daemon for gpio switch

# Overview

This application shutdown OS after gpio switch pressed longer than 2 seconds.

# Usage

- Run the `./build/build.sh` command to start generating binary code `./build/bin/gpio-shutdown`.

- Connect GPIO2 (gpio number 3) and Ground (gpio number 6 and so on) to mechanical button.

- Run the `./build/bin/gpio-shutdown` command to start shutdown daemon.

- Now, you can shutdown OS by pressing button longer than 2 seconds.

- (Option) Run the `./scripts/setup.sh` command to register gpio-shutdown daemon as systemd service.

# Supported OS

Only tested with Ubuntu server 20.04 64bit OS on Raspberry Pi 4B
