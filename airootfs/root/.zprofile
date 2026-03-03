if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  # 1. Auto-install the package from your local repo
  # --noconfirm ensures it doesn't wait for you to press 'Y'
  pacman -Sy
  pacman -U --noconfirm /root/local_repo/calamares-*.pkg.tar.zst
  
  # 2. Start the Plasma Wayland session
  exec dbus-run-session startplasma-wayland
fi
