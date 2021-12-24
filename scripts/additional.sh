#!/bin/bash

arch-chroot /mnt pacman -Syu --noconfirm ttf-dejavu
arch-chroot /mnt pacman -Syu --noconfirm python
arch-chroot /mnt pacman -Syu --noconfirm xdotool
arch-chroot /mnt pacman -Syu --noconfirm git
