#!/bin/bash

# Obtener la ventana actualmente enfocada
window_id=$(xdotool getactivewindow 2>/dev/null)

# Comprobar si se obtuvo un ID de ventana válido
#if [ -z "$window_id" ] || [ "$window_id" -eq 0 ] || ! [[ "$window_id" =~ ^[0-9]+$ ]]; then
if ! [[ "$window_id" =~ ^[0-9]+$ ]]; then
  echo "%{F#e83030}%{T3} %{F#ffffff}%{T1} Desktop%{u-}"
else
  # Obtener el nombre de la aplicación asociada a esa ventana
  app_name=$(xprop -id $window_id | awk -F '"' '/WM_CLASS/ {print $4}')
  app_name=$(echo "$app_name" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')

  if [[ ${#app_name} -le 13 ]]; then
    echo "%{F#e83030}%{T3} %{F#ffffff}%{T1} $app_name%{u-}"
  else
    #echo $app_name
    app_name=${app_name:0:13}
    echo "%{F#e83030}%{T3} %{F#ffffff}%{T1} $app_name..%{u-}"
  fi
fi
