# gpio-shutdown

shutdown daemon for gpio switch

# Overview

This application shutdown OS after gpio switch pressed longer than 5 seconds.

# Installation

### Software

Below scripts download binary script and systemd service file, then start systemd service.

```bash
curl -s https://raw.githubusercontent.com/ktr03rtk/gpio-shutdown/main/scripts/setup.sh -o setup.sh
sudo ./setup.sh
```

### Hardware

- Connect GPIO2 (gpio number 3) and Ground (gpio number 6 and so on) to mechanical button.

# Supported OS

Only tested with Ubuntu server 20.04 64bit OS on Raspberry Pi 4B
