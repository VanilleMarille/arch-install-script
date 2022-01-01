#!/bin/bash

arch-chroot /mnt pacman -S --noconfirm i3-gaps i3status i3lock dmenu
arch-chroot /mnt pacman -S --noconfirm kitty feh

#Uncomment for wlan
#arch-chroot /mnt pacman -S --noconfirm iwd
#Uncomment for sound
#arch-chroot /mnt pacman -S --noconfirm pulseaudio pulsemixer
