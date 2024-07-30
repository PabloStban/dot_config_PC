#!/bin/bash

polybar-msg -p "$(pgrep -f "polybar Apuntes")" cmd toggle
