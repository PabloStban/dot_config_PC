#!/bin/bash

# Archivo donde se almacenará el historial de copias
HISTORY_FILE="$HOME/.clipboard_history"
touch clipboard.tmp

# Función para actualizar el historial y mostrar el último elemento copiado
update_clipboard_history() {
  # Obtiene el contenido actual del portapapeles
  current_clip="$(wl-paste)"
  comparar << .clipboard.tmp

  # Si el contenido actual no es igual al último en el historial, lo añade
  if [[ "$comparar" != "$current_clip" ]]; then
    echo "$current_clip" >>"$HISTORY_FILE"
  fi

  comparar="$(wl-paste)"

  # Muestra el último elemento copiado
  #echo "$current_clip"
}
