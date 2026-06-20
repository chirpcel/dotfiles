#!/usr/bin/env bash

BATTERY=$(upower -e | grep 'BAT' | head -n 1)

if [ -z "$BATTERY" ]; then
    echo "󰂑 No Battery"
    exit 0
fi

INFO=$(upower -i "$BATTERY")
STATE=$(echo "$INFO" | awk '/state:/ {print $2}')
PERCENTAGE=$(echo "$INFO" | awk '/percentage:/ {print $2}' | tr -d '%' | cut -d. -f1)

if ! [[ "$PERCENTAGE" =~ ^[0-9]+$ ]]; then
    echo "󰂑 ??%"
    exit 0
fi

if [[ "$STATE" == "charging" ]]; then
    if [ "$PERCENTAGE" -ge 95 ]; then
        ICON="󰂅"
    elif [ "$PERCENTAGE" -ge 90 ]; then
        ICON="󰂋"
    elif [ "$PERCENTAGE" -ge 80 ]; then
        ICON="󰂊"
    elif [ "$PERCENTAGE" -ge 70 ]; then
        ICON="󰢞"
    elif [ "$PERCENTAGE" -ge 60 ]; then
        ICON="󰂉"
    elif [ "$PERCENTAGE" -ge 50 ]; then
        ICON="󰢝"
    elif [ "$PERCENTAGE" -ge 40 ]; then
        ICON="󰂈"
    elif [ "$PERCENTAGE" -ge 30 ]; then
        ICON="󰂇"
    elif [ "$PERCENTAGE" -ge 20 ]; then
        ICON="󰂆"
    elif [ "$PERCENTAGE" -ge 10 ]; then
        ICON="󰢜"
    else
        ICON="󰢟"
    fi
elif [[ "$STATE" == "fully-charged" ]]; then
    ICON="󰁹"
elif [[ "$STATE" == "pending-charge" ]]; then
    ICON="󱈏"
else
    if [ "$PERCENTAGE" -ge 95 ]; then
        ICON="󰁹"
    elif [ "$PERCENTAGE" -ge 90 ]; then
        ICON="󰂂"
    elif [ "$PERCENTAGE" -ge 80 ]; then
        ICON="󰂁"
    elif [ "$PERCENTAGE" -ge 70 ]; then
        ICON="󰂀"
    elif [ "$PERCENTAGE" -ge 60 ]; then
        ICON="󰁿"
    elif [ "$PERCENTAGE" -ge 50 ]; then
        ICON="󰁾"
    elif [ "$PERCENTAGE" -ge 40 ]; then
        ICON="󰁽"
    elif [ "$PERCENTAGE" -ge 30 ]; then
        ICON="󰁼"
    elif [ "$PERCENTAGE" -ge 20 ]; then
        ICON="󰁻"
    elif [ "$PERCENTAGE" -ge 10 ]; then
        ICON="󰁺"
    else
        ICON="󰂎"
    fi
fi

echo "$ICON $PERCENTAGE%"
