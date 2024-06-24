#!/bin/bash
name=tun0

IFACE=$(/usr/bin/ifconfig | grep $name | awk '{print $1}' | tr -d ":")

if [[ $IFACE = "$name" ]]; then
	echo "%{F#1bbf3e}%{T3} %{F#ffffff}%{T1} $(/usr/bin/ifconfig $name | grep "inet " | awk '{print $2}')%{u-}"
else
	echo "%{F#e83030}%{T3} %{F#ffffff}%{T1} Disconected%{u-}"
fi
