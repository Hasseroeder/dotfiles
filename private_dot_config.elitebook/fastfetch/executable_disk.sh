#!/bin/zsh

#!/bin/zsh

df --output=source,fstype,used,size -B1 $1 \
| awk '
NR==2 {
    sub("/dev/","",$1);

    usedGiB = $3/1024/1024/1024;
    sizeGiB = $4/1024/1024/1024;
    ratio = usedGiB / sizeGiB;

    # Compute RGB gradient (green → yellow → red)
    # Red increases with usage, green decreases
    r = int(255 * ratio);
    g = int(255 * (1 - ratio));
    b = 0;

    # Truecolor escape sequence
    color = sprintf("\033[38;2;%d;%d;%dm", r, g, b);
    reset = "\033[0m";

    printf "%s %s %s%.2f GiB%s / %.2f GiB\n",
           $1, $2, color, usedGiB, reset, sizeGiB;
}'
