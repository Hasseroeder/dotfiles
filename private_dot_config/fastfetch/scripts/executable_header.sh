#!/bin/sh

# $1 is left padding
# $2 is heading text
# $3 is full length

header="┌"
header="$header$(printf '─%.0s' $(seq 1 $1))"
header="$header $2 "

length=$(printf "$header" | wc -m)

right_padding=$(expr $3 - $length - 1)
header="$header$(printf '─%.0s' {$(seq 1 $right_padding)})"
header="$header┐"
printf "\e[0;90m$header\n"
