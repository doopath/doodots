#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [[ "$player_status" == "Playing" ]] || [[ "$player_status" == "Paused" ]]; then
  output="♪ $(playerctl metadata title | cut -c1-50)"
  echo $output"..."
else
  echo "Any players are stopped :<"
fi
