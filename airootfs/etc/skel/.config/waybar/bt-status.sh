#!/bin/bash

icon_on=""   # Bluetooth logo (connected)
icon_off=""  # Bluetooth logo (disconnected/off)

# If no Bluetooth controller is detected
if ! bluetoothctl show &>/dev/null; then
    echo "{\"text\":\"$icon_off\",\"class\":\"no-controller\"}"
    exit 0
fi

# If adapter is powered off
if ! bluetoothctl show | grep -q "Powered: yes"; then
    echo "{\"text\":\"$icon_off\",\"class\":\"off\"}"
    exit 0
fi

# If at least one device is connected
if bluetoothctl info | grep -q "Connected: yes"; then
    echo "{\"text\":\"$icon_on\",\"class\":\"connected\"}"
else
    echo "{\"text\":\"$icon_off\",\"class\":\"disconnected\"}"
fi
