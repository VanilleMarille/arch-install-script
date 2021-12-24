#!/bin/bash

USERNAME=$1

arch-chroot /mnt pacman -S --noconfirm zsh

echo '%wheel ALL=(ALL) ALL' | arch-chroot /mnt sudo EDITOR='tee -a' visudo


arch-chroot /mnt useradd -m -g users -s /bin/zsh $USERNAME

echo 
echo Set root password:
arch-chroot /mnt passwd
echo
echo Set $USERNAME password:
arch-chroot /mnt passwd $USERNAME
echo
 

arch-chroot /mnt gpasswd -a $USERNAME wheel



