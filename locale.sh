#!/bin/bash

arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
arch-chroot /mnt hwclock --systohc


echo de_DE.UTF-8 >> /mnt/etc/locale.gen

arch-chroot /mnt localectl set-locale LANG=de_DE.UTF-8

arch-chroot /mnt locale-gen

exit
touch /mnt/etc/X11/xorg.conf.d/20-keyboard.conf
cat <<EOF> /mnt/etc/X11/xorg.conf.d/20-keyboard.conf

Section "InputClass"
	Identifier "keyboard"
	MatchIsKeyboard "yes"
	Option "XkbLayout" "de"
	Option "XkbVariant" "nodeadkeys"
EndSection
EOF

