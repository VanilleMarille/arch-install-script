#!/bin/bash

USER=username

arch-chroot /mnt pacman -S budgie-desktop

touch /mnt/home/$USER/.xinitrc
cat <<EOF> /mnt/home/$USER/.xinitrc
export XDG_CURRENT_DESKTOP=Budgie:GNOME
exec budgie-desktop
EOF

touch /mnt/home/$USER/.bashrc
cat <<EOF> /mnt/home/$USER/.zshrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
EOF

