#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

bspwmbar="doobar-bspwm"
i3bar="doobar-i3"

bspwmpolybar=$(polybar --reload $bspwmbar -c ~/.config/polybar/doobar.ini &)
i3polybar=$(polybar --reload $i3bar -c ~/.config/polybar/doobar.ini &)

case $desktop in

    i3|/usr/share/xsessions/i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m $i3polybar
      done
    else
    $i3polybar
    fi
    ;;

    bspwm|/usr/share/xsessions/bspwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m $bspwmpolybar
      done
    else
    $bspwmpolybar
    fi
    ;;

esac
