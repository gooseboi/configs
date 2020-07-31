#!/bin/bash

[ -f ~/.xprofile ] && . ~/.xprofile

while :; do
	exec dwm 2> /dev/null
done
