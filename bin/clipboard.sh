#!/bin/bash

# 36 - 5
# Obtener el contenido del portapapeles
clipboard_content=$(xclip -o -selection clipboard)
clip=${clipboard_content:0:36}

# Verificar si el portapapeles está vacío
if [ -z "$clipboard_content" ]; then
  echo "%{F#ff0000}%{T9}󰆏 %{F#ffffff}%{T1} ---------------------------------------%{u-}"
else
  if [ ${#clipboard_content} -gt 36 ]; then
    echo "%{F#2495e7}%{T9}󰆏 %{F#ffffff}%{T1} $clip ....%{u-}"
  else
    echo "%{F#2495e7}%{T9}󰆏 %{F#ffffff}%{T1} $clipboard_content %{u-}"
  fi
fi

#echo "%{F#e83030}%{T9}󰆏 %{F#ffffff}%{T1} $target%{u-}"
