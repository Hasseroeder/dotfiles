#!/bin/sh

start_ts=$1

# Convert to epoch seconds
start_epoch=$(date -d "$start_ts" +%s)
now_epoch=$(date +%s)

# Calculate uptime in seconds
uptime=$(( now_epoch - start_epoch ))

# Convert to human-readable
days=$(( uptime / 86400 ))
hours=$(( (uptime % 86400) / 3600 ))
mins=$(( (uptime % 3600) / 60 ))

if [ "$days" -gt 0 ]; then
    echo "${days}d ${hours}h ${mins}m"
elif [ "$hours" -gt 0 ]; then
    echo "${hours}h ${mins}m"
else
    echo "${mins}m"
fi
