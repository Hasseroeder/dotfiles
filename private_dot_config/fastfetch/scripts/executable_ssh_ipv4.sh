#!/usr/bin/sh

printf " %s \033[90m///\033[0m  %s \n" \
	$(ip -4 addr show scope global | awk '/inet/ {print $2; exit}' | cut -d/ -f1) \
	$(echo $SSH_CLIENT | cut -d' ' -f1)
