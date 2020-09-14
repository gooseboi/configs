#!/bin/bash

[ -f ~/.xprofile ] && . ~/.xprofile

exec dwm 2> /dev/null
