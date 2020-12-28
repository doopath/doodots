#!/usr/bin/sh
killall -e picom            
while pgrep -u $UID -x picom > /dev/null; do sleep 2; done
picom --config /home/doopath/.config/picom/picom.conf -b
sleep 3
