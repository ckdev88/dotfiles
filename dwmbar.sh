#!/bin/bash
xsetroot -name "loading dwm..."
echo "-" > ~/aliases/tmp
curl ifconfig.co -s -o ~/aliases/tmp
echo "$(cat ~/aliases/tmp)" > ~/aliases/wifi

while true; do
    xmodmap ~/.Xmodmap
    xset r rate 175 75

    energy_perc0=$(cat /sys/class/power_supply/BAT0/capacity)
    energy_perc1=$(cat /sys/class/power_supply/BAT1/capacity)
    energy_perc=$(( (energy_perc0 + energy_perc1) / 2 ))

    energy_charging=$(cat /sys/class/power_supply/AC/online)
    energy_add="<"
    if [ "$energy_charging" -eq 1 ]; then
        energy_add=">"
    elif [ "$energy_perc" -lt 15 ]; then
        loginctl suspend
    fi

    wifi_status=$(cat ~/aliases/wifi)
    # time_local=$(date +%H:%M:%S)
    time_NED=$(TZ=Europe/Brussels date +%H:%M)
    time_BRA=$(TZ=America/Sao_Paulo date +%H:%M)

    xsetroot -name "$wifi_status $energy_add$energy_perc% $time_NED/$time_BRA"

    sleep 60
done
