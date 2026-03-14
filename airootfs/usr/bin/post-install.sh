#!/bin/bash
# HyprArch Finalization Script

echo "Cleaning up ISO artifacts..."

# 1. Restore SDDM (Removes the mask and enables the service)
rm -f /etc/systemd/system/display-manager.service
rm -f /etc/systemd/system/sddm.service
systemctl enable sddm

# 2. Cleanup Root (The ISO-only autostart)
rm -f /root/.zprofile

# 3. Surgery on /etc/profile (Keeping the file, removing the hijack)
# We use 'sed' to delete lines containing our ISO triggers
sed -i '/hyprland/d' /etc/profile
sed -i '/startplasma/d' /etc/profile
sed -i '/exec /d' /etc/profile

# 4. Precise User .zshrc Restore
# This finds the actual username created by Calamares in /home
USER_NAME=$(ls /home | grep -v "lost+found")

if [ -n "$USER_NAME" ]; then
    echo "Restoring .zshrc for user: $USER_NAME"
    mv "/home/$USER_NAME/.zshrc.bak" "/home/$USER_NAME/.zshrc" 2>/dev/null
    # Fix ownership so the user can actually use the file
    chown "$USER_NAME:$USER_NAME" "/home/$USER_NAME/.zshrc" 2>/dev/null
    rm -rf /home/$USER_NAME/.config/plasma*
    rm -rf /home/$USER_NAME/.config/kde*
    rm -rf /home/$USER_NAME/.cache/*
    chsh -s /bin/zsh "$USER_NAME"
fi

# 5. Remove Installer Binaries
rm -f /usr/bin/calamares

echo "Done! The system is ready for reboot."
