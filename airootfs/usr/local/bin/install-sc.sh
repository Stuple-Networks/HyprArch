#!/bin/bash

mkdir -p /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux

# 3. Get Reflector (Using --needed so it doesn't reinstall if already there)
pacman -Sy --noconfirm --needed reflector

# 4. Clean the Mirrorlist (The most important part!)
reflector --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# 5. Final sync so the 'packages' module is ready to go
pacman -Sy
