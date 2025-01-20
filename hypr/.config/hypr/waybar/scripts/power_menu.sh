#!/bin/bash

# Define options
options="Shutdown\nReboot\nLogout"

# Display the menu using rofi
chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu")

# Perform actions based on user choice
case $chosen in
    "Shutdown")
        # Shutdown command
        poweroff
        ;;
    "Reboot")
        # Reboot command
        reboot
        ;;
    "Logout")
        hyperctl dispatch exit

        ;;
    *)
        exit 1  # Exit if no valid option is chosen
        ;;
esac

