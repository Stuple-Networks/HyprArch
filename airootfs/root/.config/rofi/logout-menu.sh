#!/bin/bash

# Path to your icons
ICON_PATH="$HOME/.config/wlogout"

# Define the menu options with icons
OPTIONS=" Shutdown\n Reboot\n Lock\n Suspend\n Logout"

# Show menu using rofi
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "System" -theme-str '
  * {
    background: #1c1c1c;
    color: #ffffff;
    font: "Sans 12";
    selected-background: #ff5555;
    selected-foreground: #ffffff;
    spacing: 10px;
  }
')

# Execute based on selection
case "$CHOICE" in
  " Shutdown") systemctl poweroff ;;
  " Reboot") systemctl reboot ;;
  " Lock") i3lock-fancy ;;
  " Suspend") systemctl suspend ;;
  " Logout") pkill -KILL -u $USER ;;
esac
