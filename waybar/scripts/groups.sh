#!/bin/bash

#windowsgroup cantidad de ventanas en el grupo
#cantidad todas las ventanas separadas por,(id)
#actual el id de la ventana 
#windows # de windows en el workspace actual

windowsgoup=$(hyprctl activewindow | grep grouped: | cut -d ":" -f2 | awk -F, '{print NF}')
cantidad=$(hyprctl activewindow | grep grouped: | cut -d ":" -f2 | xargs)
actual=$(hyprctl activewindow | grep -w "Window" | cut -d " " -f2)
windows=$(hyprctl activeworkspace | grep windows | cut -d ":" -f2 | xargs)
# Crear el vector con texto separado por, se guarda en arr
# 64a7a2624e00,64a7a2655340,64a7a26262e0,64a7a26e9bf0
IFS=',' read -r -a arr <<< "$cantidad"
total=${#arr[@]}

# Buscar la posicion
for i in "${!arr[@]}";do
  if [[ "${arr[$i]}" == "$actual" ]]; then
    position=$((i + 1))
    break
  fi
done

# Condiciones para escribir
if [[ ${#cantidad} -lt 3 ]];then
  echo "$(($windows))"
else
  if [[ comprobar -eq 0 ]];then
    echo "$(($windowsgoup+$windowsgoup-1)) -> $position/$windowsgoup"
  fi
fi

#echo $cantidad
#echo "${#arr[@]}"


