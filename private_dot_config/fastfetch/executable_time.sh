#!/bin/sh

printf "%s \033[90m///\033[0m %s \033[90m///\033[0m %s\n" \
  "$(TZ=America/Edmonton date '+%H:%M  SLC')" \
  "$(TZ=America/Detroit date '+%H:%M  NYC')" \
  "$(TZ=Europe/Berlin date '+%H:%M  BER')"
