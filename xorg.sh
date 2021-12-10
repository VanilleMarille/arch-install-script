#!/bin/bash

arch-chroot /mnt pacman -S xorg-server xorg-xinit

mkdir -p /mnt/etc/X11/xorg.conf.d/
touch /mnt/etc/X11/xorg.conf.d/20-keyboard.conf
cat <<EOF> /mnt/etc/X11/xorg.conf.d/20-keyboard.conf

Section "InputClass"
	Identifier "keyboard"
	MatchIsKeyboard "yes"
	Option "XkbLayout" "de"
	Option "XkbVariant" "nodeadkeys"
EndSection
EOF
