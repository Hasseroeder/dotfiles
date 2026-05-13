#!/bin/zsh

disk="$1"
startColor="${2:-#aaeeaa}"   # default green
endColor="${3:-#ff4444}"     # default red

df --output=source,fstype,used,size -B1 "$disk" \
| awk -v c1="$startColor" -v c2="$endColor" '
function hex2rgb(hex, arr) {
    gsub("#","",hex)
    arr[1] = strtonum("0x" substr(hex,1,2))
    arr[2] = strtonum("0x" substr(hex,3,2))
    arr[3] = strtonum("0x" substr(hex,5,2))
}

NR==2 {
    sub("/dev/","",$1)

    usedGiB = $3/1024/1024/1024
    sizeGiB = $4/1024/1024/1024
    ratio = usedGiB / sizeGiB

    # parse colors
    hex2rgb(c1, start)
    hex2rgb(c2, end)

    # interpolate
    r = int(start[1] + (end[1] - start[1]) * ratio)
    g = int(start[2] + (end[2] - start[2]) * ratio)
    b = int(start[3] + (end[3] - start[3]) * ratio)

    color = sprintf("\033[38;2;%d;%d;%dm", r, g, b)
    reset = "\033[0m"

    printf "%s %s %s%.2f GiB%s / %.2f GiB\n",
           $1, $2, color, usedGiB, reset, sizeGiB
}'
