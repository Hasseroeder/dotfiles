#!/bin/sh

iface=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

if [ -n "$iface" ]; then
    ip=$(ip -4 -o addr show "$iface" | awk '{print $4}' | cut -d/ -f1)
    echo "$iface $ip"
else
    echo "no network"
fi
