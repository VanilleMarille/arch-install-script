#!/bin/bash

arch-chroot /mnt pacman -Syu zsh

echo '%wheel ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo

USER=username

useradd -m -g users -s /bin/zsh $USER
passwd $USER

gpasswd -a $USER wheel



