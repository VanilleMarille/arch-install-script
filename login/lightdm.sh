#!/bin/bash

USERNAME=username

arch-chroot /mnt pacman -S lightdm lightdm-gtk-greeter
arch-chroot /mnt systemctl enable lightdm.service 


groupadd autologin
usermod -a -G autologin $USERNAME




