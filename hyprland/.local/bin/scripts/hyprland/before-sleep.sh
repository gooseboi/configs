#!/bin/sh

hyprctl switchxkblayout at-translated-set-2-keyboard 0
playerctl pause -a
polysetvol -m
swaylock -f -i ~/.local/share/bg
