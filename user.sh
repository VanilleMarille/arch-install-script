#!/bin/bash

arch-chroot /mnt pacman -S zsh

echo '%wheel ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo

USERNAME=username

useradd -m -g users -s /bin/zsh $USERNAME
passwd $USERNAME

gpasswd -a $USERNAME wheel



