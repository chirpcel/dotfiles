#!/usr/bin/env bash

DEFAULT_IFACE=$(networkctl list --no-legend | awk '$4 == "routable" && $5 == "configured" {print $2}' | head -n 1)

if [ -z "$DEFAULT_IFACE" ]; then
    echo "󰤭 Offline"
    exit 0
fi

if [ -d "/sys/class/net/$DEFAULT_IFACE/wireless" ] || [ -d "/sys/class/net/$DEFAULT_IFACE/phy80211" ]; then
    WIFI_INFO=$(iwctl station "$DEFAULT_IFACE" show 2>/dev/null)
    SSID=$(echo "$WIFI_INFO" | grep "Connected network" | sed 's/^.*Connected network\s*//' | sed 's/[ \t]*$//')
    RSSI=$(echo "$WIFI_INFO" | grep "RSSI" | awk '{print $2}' | head -n 1)

    if [ -z "$SSID" ]; then
        echo "󰤭 Disconnected"
    else
        if [ -z "$RSSI" ]; then
            ICON="󰤨"
        elif [ "$RSSI" -ge -60 ]; then
            ICON="󰤨"
        elif [ "$RSSI" -ge -70 ]; then
            ICON="󰤥"
        elif [ "$RSSI" -ge -80 ]; then
            ICON="󰤢"
        elif [ "$RSSI" -ge -89 ]; then
            ICON="󰤟"
        else
            ICON="󰤯"
        fi

        echo "$ICON $SSID"
    fi
else
    echo "󰈀 Ethernet"
fi
