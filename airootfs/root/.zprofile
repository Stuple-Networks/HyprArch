# 1. Set environment FIRST
export XDG_RUNTIME_DIR=/run/user/0
mkdir -p /run/user/0 && chmod 700 /run/user/0
export QT_QPA_PLATFORM=wayland
export KWIN_FORCE_SW_RENDERING=1
export LANG=en_US.UTF-8

if [[ -z $DISPLAY ]]; then
  # 2. Install Calamares (Only if the file exists to prevent hanging)
  if [ -f /root/local_repo/calamares-*.pkg.tar.zst ]; then
      # Use -Sdd to skip dependency checks if you know they are installed
      pacman -U --noconfirm /root/local_repo/calamares-*.pkg.tar.zst
  fi

  # 3. Launch Plasma with a D-Bus session (This is what you're missing)
  
fi
