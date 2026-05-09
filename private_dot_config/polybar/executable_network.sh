#!/bin/sh

# Get IPs (empty if disconnected)
eth_ip=$(ip -4 addr show enp0s25 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
wlan_ip=$(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Prefer LAN
if [ -n "$eth_ip" ]; then
    echo "eth0 $eth_ip"
elif [ -n "$wlan_ip" ]; then
    echo "wlan0 $wlan_ip"
else
    echo "no network"
fi

