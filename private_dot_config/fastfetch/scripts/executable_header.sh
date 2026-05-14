#!/bin/sh

# $1 is left padding
# $2 is heading text
# $3 is full length

header="┌"
header+=$(printf '─%.0s' $(seq 1 $1))

header+=" "$2" "

right_padding=$(expr "$3 - ${#header} - 1")
header+=$(printf '─%.0s' {1..$right_padding})
header+="┐"
printf "\\u001b[90m$header\n"
