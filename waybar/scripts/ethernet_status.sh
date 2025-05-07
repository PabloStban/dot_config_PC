#!/bin/bash

#echo "%{F#2495e7}󰖟 %{F#ffffff} $(/usr/bin/ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"

name="wlan0"

IFACE=$(ip a s dev wlan0 | grep $name | head -1 | awk '{print $2}' | tr -d ":")

if [[ $IFACE = "$name" ]]; then
	#echo "%{F#1bbf3e} %{F#ffffff} $(/usr/bin/ifconfig $name | grep "inet " | awk '{print $2}')%{u-}"
  echo "$(ip a s dev $name | grep "inet " | head -1 | awk '{print $2}' | cut -d "/" -f1)"
else
	echo "Disconected"
fi
