#!/bin/sh

light -G > /dev/null 2>&1 | grep No || exit
light -G | sed 's/\.[0-9]*//'
