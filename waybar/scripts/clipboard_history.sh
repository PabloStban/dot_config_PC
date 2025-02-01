#!/bin/bash

:'clip="$(wl-paste)"
longitud=${#clip}

if  [[ longitud -gt 40 ]]; then
  palabra="${clip:0:40}..."
  printf "%s\n" "$palabra"
else
  printf "%s\n" "$clip"
fi'


# Asegúrate de que wl-paste está disponible en tu sistema
clip="$(wl-paste -n)"
longitud=${#clip}

# Comprobamos si el portapapeles contiene una imagen
if wl-paste -l | grep -q 'image'; then
  # Si es una imagen, mostramos el texto que elijas
  echo "   "
else
  # Si no es una imagen, procedemos con la lógica anterior para texto
  if [[ $longitud -gt 40 ]]; then
    palabra="${clip:0:40}..."
    printf "%s\n" "$palabra"
  else
    printf "%s\n" "$clip"
  fi
fi



