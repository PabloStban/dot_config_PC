#!/bin/bash

target="No target"

if [[ $target = "No target" ]]; then
	#	echo "%{F#e83030}󰩷 %{F#ffffff} $target%{u-}"
	echo "%{F#e83030}%{T9}󰩷 %{F#ffffff}%{T1} $target%{u-}"
else
	#contenido=$(grep "target=" /home/pablo/.config/bin/target.sh | sed 's/\//\\\//g' | cut -d"=" -f2 | sed 's/"//g' | head -1)
	echo "%{F#1bbf3e}%{T9}󰩷 %{F#ffffff}%{T1} $target%{u-}"
fi
