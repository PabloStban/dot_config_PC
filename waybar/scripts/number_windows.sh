#!/bin/bash

# Obtener la lista de ventanas en el workspace actual
window_count=$(hyprctl clients | grep 'focusHistoryID' | head -1 | cut -d " " -f 2)

# Mostrar la cantidad de ventanas
echo "Ventanas abiertas en el workspace '$window_count'"

