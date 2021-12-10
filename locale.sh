#!/bin/bash

arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
arch-chroot /mnt hwclock --systohc
arch-chroot /mnt vim /etc/locale.gen
arch-chroot /mnt locale-gen
arch-chroot /mnt locale > /etc/locale.conf

touch /mnt/etc/X11/xorg.conf.d/20-keyboard.conf
cat <<EOF> /mnt/etc/X11/xorg.conf.d/20-keyboard.conf

Section "InputClass"
	Identifier "keyboard"
	MatchIsKeyboard "yes"
	Option "XkbLayout" "de"
	Option "XkbVariant" "nodeadkeys"
EndSection
EOF

