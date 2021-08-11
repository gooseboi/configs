#!/bin/sh

bat_number=0
acpi=$(acpi -b 2>/dev/null| grep "Battery $bat_number")
ac_adapt=$(acpi -a | awk '{print $2}')
mode=$(echo "$acpi" | awk '{print $3}')
percent=$(echo "$acpi" | awk '{print $4}'| grep -Eo '[0-9]*')
remaining=$(echo "$acpi" | awk '{print $5}')
symbol=""


if [ "$mode" = "Discharging," ]; then
  symbol='⚡ '
elif [ "$mode" = "Charging," ]; then
  symbol='🔌 '
elif [ "$mode" = "Unknown," ]; then
  if [ "$ac_adapt" = "on-line," ]; then
    symbol='⚡ '
  elif [ "$ac_adapt" = "off-line," ]; then
    symbol='🔌 '
  fi
else
  symbol='🔋 '
fi

printf "%s%s" "$symbol" "$percent%"

if [ "$mode" = "Discharging," ] || [ "$mode" = "Charging," ] || [ "$ac_adapt" = "off-line," ]; then
  echo " ($remaining)"
fi


