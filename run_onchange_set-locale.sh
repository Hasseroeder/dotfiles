#!/bin/sh
set -eu

echo 'LANG=en_US.UTF-8' | sudo tee /etc/locale.conf >/dev/null
