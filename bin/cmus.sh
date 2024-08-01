#!/bin/bash

# Obtener la información de cmus usando cmus-remote
status=$(cmus-remote -Q 2>/dev/null)
if [ $? -ne 0 ]; then
  #jecho "Cmus no está en ejecución"
  echo "%{F#2495e7}%{T3} %{F#ffffff}%{T1} Waiting to listen music ...%{u-}"
  exit 1
fi

# Extraer la información
#title=$(echo "$status" | grep '^title' | cut -d ' ' -f 2-)
#artist=$(echo "$status" | grep '^artist' | cut -d ' ' -f 2-)
title=$(cmus-remote -Q 2>/dev/null | grep file | awk -F '/' '{print $NF}')
title_corto=${title:0:23}
status=$(echo "$status" | grep '^status' | cut -d ' ' -f 2)

# Formatear la información
if
  [[ "$status" = "playing" ]] && [[ ${#title} -le 23 ]]
then
  #echo "  $title"
  echo "%{F#00ff00}%{T3} %{F#ffffff}%{T1} $title%{u-}"

elif [[ "$status" = "playing" ]] && [[ ${#title} -gt 23 ]]; then
  echo "%{F#00ff00}%{T3} %{F#ffffff}%{T1} $title_corto ...%{u-}"

elif [[ "$status" = "paused" ]] && [[ ${#title} -le 23 ]]; then
  #echo "  $title"
  echo "%{F#ff0000}%{T3} %{F#ffffff}%{T1} $title%{u-}"

elif [[ "$status" = "paused" ]] && [[ ${#title} -gt 23 ]]; then
  echo "%{F#ff0000}%{T3} %{F#ffffff}%{T1} $title_corto ...%{u-}"
fi
