#!/bin/bash

# List of workspaces and their icons
declare -A workspaces
workspaces=(["1"]="" ["2"]="" ["3"]="" ["4"]="" ["5"]="" ["6"]="" ["7"]="" ["8"]="" ["9"]="" ["10"]="")

# Colors for the workspaces
ACTIVE_BG="#83a598"
ACTIVE_FG="#282828"
INACTIVE_BG="#3c3836"
INACTIVE_FG="#a89984"
URGENT_BG="#fb4934"
URGENT_FG="#282828"

# Get the status of workspaces
ws_info=$(i3-msg -t get_workspaces)

output=""
for ws in "${!workspaces[@]}"; do
  icon=${workspaces[$ws]}
  name=$(echo "$ws_info" | jq --arg name "$ws" -r '.[] | select(.name==$name) | .name // $name')
  focused=$(echo "$ws_info" | jq --arg name "$ws" -r '.[] | select(.name==$name) | .focused // false')
  urgent=$(echo "$ws_info" | jq --arg name "$ws" -r '.[] | select(.name==$name) | .urgent // false')

  if [ "$urgent" == "true" ]; then
    output+="%{B$URGENT_BG}%{F$URGENT_FG}%{T3} $icon %{T-}%{B-}%{F-}"
  elif [ "$focused" == "true" ]; then
    output+="%{B$ACTIVE_BG}%{F$ACTIVE_FG}%{T3} $icon %{T-}%{B-}%{F-}"
  else
    output+="%{B$INACTIVE_BG}%{F$INACTIVE_FG}%{T3} $icon %{T-}%{B-}%{F-}"
  fi
done

echo $output
