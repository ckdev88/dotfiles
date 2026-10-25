#!/bin/bash

needs_xmodmap() {
    local dump line line_nc kc n i live_line
    local -a file_parts live_parts
    dump=$(xmodmap -pke)

    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ "$line" =~ ^keycode[[:space:]]+([0-9]+)[[:space:]]+= ]] || continue
        kc="${BASH_REMATCH[1]}"

        line_nc="${line%%#*}"
        read -ra file_parts <<< "${line_nc#*=}"
        n=${#file_parts[@]}
        (( n == 0 )) && continue

        live_line=$(printf '%s\n' "$dump" | awk -v kc="$kc" '$1=="keycode" && $2==kc {print; exit}')
        [[ -z "$live_line" ]] && return 0          # keycode missing from server -> reload

        read -ra live_parts <<< "${live_line#*=}"

        for ((i = 0; i < n; i++)); do
            [[ "${live_parts[i]:-}" != "${file_parts[i]}" ]] && return 0
        done
    done < "$HOME/.Xmodmap"

    return 1
}

main() {
    xsetroot -name "loading dwm..."
    echo "-" > ~/aliases/tmp
    curl ifconfig.co -s -o ~/aliases/tmp
    echo "$(cat ~/aliases/tmp)" > ~/aliases/wifi

    while true; do
        if needs_xmodmap; then
            xmodmap ~/.Xmodmap
        fi
        xset r rate 175 75

        energy_perc0=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo 0)
        energy_perc1=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 2>/dev/null | awk '/percentage/{print int($2)}' || echo 0)
        energy_perc=$(( (energy_perc0 + energy_perc1) / 2 ))

        energy_charging=$(cat /sys/class/power_supply/AC/online)
        energy_add="<"
        if [ "$energy_charging" -eq 1 ]; then
            energy_add=">"
        elif [ "$energy_perc" -lt 15 ]; then
            loginctl suspend
        fi

        wifi_status=$(cat ~/aliases/wifi)
        time_local=$(date +%H:%M:%S)

        xsetroot -name "$wifi_status $energy_add$energy_perc% $time_local"

        sleep 60
    done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
