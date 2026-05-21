#!/bin/sh

# $1 is left padding
# $2 is heading text
# $3 is full length

header="┌"
header="$header$(printf '─%.0s' $(seq 1 $1))"
header="$header $2 "

right_padding=$(expr "$3 - ${#header} - 1")
header="$header$(printf '─%.0s' {1..$right_padding})"
header="$header┐"
printf "\e[38;2;153;170;187m$header\n"
