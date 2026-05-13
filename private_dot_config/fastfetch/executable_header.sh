#!/bin/zsh
typeset -i left_padding=$1
typeset -i full_length=$3

header="┌"
header+=$(printf '─%.0s' {1..$left_padding})
header+=" "$2" "

right_padding=$(( full_length - ${#header} - 1 ))
header+=$(printf '─%.0s' {1..$right_padding})
header+="┐"
echo "\u001b[90m"$header
