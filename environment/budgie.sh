#!/bin/bash

USERNAME=username

arch-chroot /mnt pacman -S budgie-desktop
arch-chroot /mnt pacman -S mate-terminal

touch /mnt/home/$USERNAME/.xinitrc
cat <<EOF> /mnt/home/$USERNAME/.xinitrc
export XDG_CURRENT_DESKTOP=Budgie:GNOME
exec budgie-desktop
EOF

touch /mnt/home/$USERNAME/.zshrc
cat <<EOF> /mnt/home/$USERNAME/.zshrc
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
EOF

