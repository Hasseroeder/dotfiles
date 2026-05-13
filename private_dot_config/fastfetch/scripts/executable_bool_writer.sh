#!/usr/bin/zsh
[[ "$1" -eq 0 ]] && echo "\033[38;2;143;240;164mRunning" \
                 || echo "\033[38;2;246;97;81mNot Running"
