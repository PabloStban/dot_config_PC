#!/bin/bash
name="tun0"

IFACE=$(ip a s dev $name | grep $name | head -1 | awk '{print $2}' | tr -d ":")

if [[ $IFACE = "$name" ]]; then
	echo "  $(ip a s dev $name | grep "inet " | head -1 | awk '{print $2}' | cut -d "/" -f1)"
else
	echo "  Disconected"
fi
