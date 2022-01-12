#!/bin/bash

arch-chroot /mnt pacman -S --noconfirm sway rofi
arch-chroot /mnt pacman -S --noconfirm pulseaudio pulsemixer ffmpeg
arch-chroot /mnt pacman -S --noconfirm ntfs-3g
