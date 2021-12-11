#!/bin/bash

arch-chroot /mnt pacman -S --noconfirm zsh

echo '%wheel ALL=(ALL) ALL' | arch-chroot /mnt sudo EDITOR='tee -a' visudo

USERNAME=username

arch-chroot /mnt useradd -m -g users -s /bin/zsh $USERNAME
arch-chroot /mnt passwd $USERNAME

arch-chroot /mnt gpasswd -a $USERNAME wheel



