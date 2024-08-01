#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar log -c ~/.config/polybar/current.ini &   # logo
polybar fecha -c ~/.config/polybar/current.ini & # date
#polybar ip_internet -c ~/.config/polybar/current.ini & # ip
#polybar target -c ~/.config/polybar/current.ini &        # target
#polybar vpn_status -c ~/.config/polybar/current.ini &    # vpn
polybar software -c ~/.config/polybar/current.ini &      # apps
polybar terciaryright -c ~/.config/polybar/current.ini & # language
polybar clipboard -c ~/.config/polybar/current.ini &     # clipboard
polybar systraymod -c ~/.config/polybar/current.ini &    # systray
polybar songs -c ~/.config/polybar/current.ini &         # cmus

## Right bar
#polybar top -c ~/.config/polybar/current.ini &
#polybar primary -c ~/.config/polybar/current.ini &
#polybar secondaryright -c ~/.config/polybar/current.ini &
polybar Apuntes -c ~/.config/polybar/current.ini & #apuntes

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini & # workstation
