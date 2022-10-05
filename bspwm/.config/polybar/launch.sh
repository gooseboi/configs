#!/usr/bin/env sh

# Terminate already running bar instances
# and wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
	killall -q -KILL polybar
	sleep 1
done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
