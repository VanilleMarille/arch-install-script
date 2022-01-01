#!/bin/bash

arch-chroot /mnt pacman -S --noconfirm i3-gaps i3status i3lock dmenu
arch-chroot /mnt pacman -S --noconfirm pulseaudio pulsemixer ffmpeg
arch-chroot /mnt pacman -S --noconfirm ntfs-3g
arch-chroot /mnt pacman -S --noconfirm kitty feh

#Uncomment for wlan
#arch-chroot /mnt pacman -S --noconfirm iwd
