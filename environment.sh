#!/bin/bash

USERNAME=username

arch-chroot /mnt pacman -S budgie-desktop

touch /mnt/home/$USERNAME/.xinitrc
cat <<EOF> /mnt/home/$USERNAME/.xinitrc
export XDG_CURRENT_DESKTOP=Budgie:GNOME
exec budgie-desktop
EOF

touch /mnt/home/$USERNAME/.bashrc
cat <<EOF> /mnt/home/$USERNAME/.zshrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
EOF

