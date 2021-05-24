#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Multiple monitors
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload bar1 &
#  done
#else
#  polybar --reload bar1 &
# fi

# Launch bars
 echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
 polybar -r leftScreenWorkspace 2>&1 | tee -a /tmp/polybar1.log & disown
 polybar -r rightScreenWorkspace 2>&1 | tee -a /tmp/polybar2.log & disown
 polybar -r leftScreenWindowName 2>&1 | tee -a /tmp/polybar3.log & disown
 polybar -r leftScreenTray 2>&1 | tee -a /tmp/polybar4.log & disown
echo "Bars launched..."

