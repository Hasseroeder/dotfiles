#!/usr/bin/sh
[[ "$1" -eq 0 ]] && printf "\033[38;2;143;240;164mRunning\n" \
                 || printf "\033[38;2;246;97;81mNot Running\n"
