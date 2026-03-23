#!bin/bash

rm -f ~/.zshrc
mv ~/.zshrc.bak ~/.zshrc
bash /usr/local/bin/dns-setup.sh
startplasma-wayland
