#!/bin/bash

arch-chroot /mnt pacman -S zsh

arch-chroot /mnt echo '%wheel ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo

USERNAME=username

arch-chroot /mnt useradd -m -g users -s /bin/zsh $USERNAME
arch-chroot /mnt passwd $USERNAME

arch-chroot /mnt gpasswd -a $USERNAME wheel



