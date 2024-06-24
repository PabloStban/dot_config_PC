#!/bin/bash

#echo "%{F#2495e7}󰖟 %{F#ffffff} $(/usr/bin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"

name="wlan0"

IFACE=$(/usr/bin/ifconfig | grep $name | awk '{print $1}' | tr -d ":")

if [[ $IFACE = "$name" ]]; then
	#echo "%{F#1bbf3e} %{F#ffffff} $(/usr/bin/ifconfig $name | grep "inet " | awk '{print $2}')%{u-}"
	echo "%{F#2495e7}%{T3}󰖟 %{F#ffffff}%{T1} $(/usr/bin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"
else
	echo "%{F#e83030}%{T3}󰖟 %{F#ffffff}%{T1} Disconected%{u-}"
fi
