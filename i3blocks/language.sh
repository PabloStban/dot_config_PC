#!/bin/bash

# Obtener el código de idioma actual
lang_code=$(echo $LANG | cut -d'_' -f1)

# Devolver el alias según el código de idioma
case $lang_code in
"en")
  echo "US" # Alias para inglés
  ;;
"es")
  echo "ES" # Alias para español
  ;;
*)
  echo $lang_code # Devolver el código de idioma por defecto si no coincide con los casos anteriores
  ;;
esac
