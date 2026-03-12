# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startplasma-wayland
fi

~/.automated_script.sh
