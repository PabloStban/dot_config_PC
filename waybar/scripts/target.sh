#!/bin/bash

target="10.10.11.51"

if [[ $target = "No target" ]]; then
  #	echo "%{F#e83030}󰩷 %{F#ffffff} $target%{u-}"
  echo "$target"
else
  #contenido=$(grep "target=" /home/pablo/.config/bin/target.sh | sed 's/\//\\\//g' | cut -d"=" -f2 | sed 's/"//g' | head -1)
  echo "$target"
fi
