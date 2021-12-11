#!/bin/bash

USERNAME=username

arch-chroot /mnt pacman -S --noconfirm lightdm lightdm-gtk-greeter
arch-chroot /mnt systemctl enable lightdm.service 


groupadd autologin
usermod -a -G autologin $USERNAME

sed -i "s/#autologin-user.*/autologin-user=$USERNAME/" /mnt/etc/lightdm/lightdm.conf 




